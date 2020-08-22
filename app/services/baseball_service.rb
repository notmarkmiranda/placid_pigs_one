require "net/http"

class BaseballService
  include DateHelper

  attr_reader :uri

  TEAM_ABBREVS = {
    'KC': 'KAN',
    'MIA': 'FLA',
    'WSH': 'WAS'
  }

  def initialize(year, month, day)
    url = "http://gd2.mlb.com/components/game/mlb/year_#{year}/month_#{month}/day_#{day}/master_scoreboard.json"
    @uri = URI(url)
  end

  def parse_games
    response = Net::HTTP.get(uri)
    response_parser(JSON.parse(response))
  end

  private

  def response_parser(response)
    games = response['data']['games']['game']
    games.map { |game| create_game_info(game) }.compact
  end

  def create_game_info(game)
    game.deep_symbolize_keys! 
    status = game[:status][:status]

    return unless status.downcase == "final"

    home_team = TEAM_ABBREVS[game[:home_name_abbrev].to_sym] || game[:home_name_abbrev]
    home_runs = game[:linescore][:r][:home].to_i
    away_team = TEAM_ABBREVS[game[:away_name_abbrev].to_sym] || game[:away_name_abbrev]
    away_runs = game[:linescore][:r][:away].to_i

    winner = home_runs > away_runs ? home_team : away_team
    loser = home_runs > away_runs ? away_team : home_team
    date = parse_date(game)

    {
      id: game[:gameday],
      status: status,
      winner: winner,
      loser: loser,
      date: date
    }
  end

  def parse_date(game_object)
    match_regex = /\d+\/\d+/
    desc = game_object[:description]
    match = desc.scan(match_regex)
    match.any? ? create_date(match.first) : strip_date(game_object[:original_date])
  end

  def create_date(date_string)
    date_split = date_string.split("/")
    raise ArgumentError unless date_split.count == 2
    Date.new(today.year, date_split[0].to_i, date_split[1].to_i)
  end

  def strip_date(date_string)
    Date.strptime(date_string, "%Y/%m/%d")
  end
end
