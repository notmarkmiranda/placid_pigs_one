class WinnerPicksJob < ApplicationJob
  queue_as :default

  def perform(winner)
    picks = Pick.where(team: winner.team, date: winner.date)
    picks.update_all(status: winner.status)
  end
end
