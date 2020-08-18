class Team < ApplicationRecord
  has_many :winners
  has_many :picks

  def self.most_by_season_and_date(season, date)
    team = joins(picks: :game_week)
      .where("game_weeks.season_id = ? AND picks.date = ?", season.id, date)
      .select("teams.*, count(picks.team_id) AS pick_count")
      .group(:id)
      .order("pick_count DESC")
      .limit(1)
      .first
    return "No picks" if team.nil?
    team.decorate.most_picked_team_and_count
  end
end
