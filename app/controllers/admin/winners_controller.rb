class Admin::WinnersController < ApplicationController
  before_action :require_admin!

  def index
    earliest_date = GameWeek.order(start_date: :asc, id: :asc).limit(1).first&.start_date
    latest_date = GameWeek.order(end_date: :desc, id: :asc).limit(1).first&.end_date
    @all_dates = earliest_date ? (earliest_date..latest_date).to_a : []
    @winners = Winner.where("date >= ? AND date <= ?", earliest_date, latest_date)
  end

  def create
    @winner = Winner.find_or_initialize_by(date: winner_params[:date], team_id: winner_params[:team_id])
    @winner.status = winner_params[:status]
    WinnerPicksJob.perform_now(@winner) if @winner.save
    redirect_to admin_winners_path
  end

  private

  def winner_params
    params.require(:winner).permit(:team_id, :status, :date)
  end
end
