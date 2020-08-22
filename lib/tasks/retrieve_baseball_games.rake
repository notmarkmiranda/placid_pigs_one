desc "Retrieve baseball games from API"
task retrieve_games: :environment do
  include DateHelper
  yesterday = today.yesterday
  
  year = yesterday.year.to_s
  month = sprintf "%02d", yesterday.month
  day = sprintf "%02d", yesterday.day

  games = BaseballService.new(year, month, day).parse_games

  games.each { |game| ResultPickJob.perform_now(game) }
end
