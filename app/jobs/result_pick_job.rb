class ResultPickJob < ApplicationJob
  queue_as :default

  def perform(result)
    winner_picks = Pick.joins(:team).where("teams.abbreviation = ? AND picks.date = ?", result[:winner], result[:date]) 
    loser_picks = Pick.joins(:team).where("teams.abbreviation = ? AND picks.date = ?", result[:loser], result[:date])
    
    winner_picks.update_all(status: :winner, game_token: result[:id])
    loser_picks.update_all(status: :loser, game_token: result[:id])
  end
end
