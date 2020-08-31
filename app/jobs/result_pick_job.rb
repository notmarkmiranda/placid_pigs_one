class ResultPickJob < ApplicationJob
  queue_as :default

  def perform(result)
    winner_picks = Pick.joins(:team, game_week: :season).where("teams.abbreviation = ? AND picks.date = ? AND seasons.active = ?", result[:winner], result[:date], true) 
    loser_picks = Pick.joins(:team, game_week: :season).where("teams.abbreviation = ? AND picks.date = ? AND seasons.active = ?", result[:loser], result[:date], true)

    winner_picks.update_all(status: :winner, game_token: result[:id])
    loser_picks.update_all(status: :loser, game_token: result[:id])
  end
end
