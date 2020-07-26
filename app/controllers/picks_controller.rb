class PicksController < ApplicationController
  before_action :authenticate_user!

  def create
    @game_week = GameWeek.find(pick_params[:game_week_id])
    @pick = current_user.picks.new(pick_params)
    authorize @pick
    @pick.save
    redirect_to @pick.season
  end

  def destroy
    pick = Pick.find(params[:id])
    season = pick.season
    pick.destroy!
    redirect_to season
  end

  private

  def pick_params
    params.require(:pick).permit(:game_week_id, :user_id, :date, :team_id)
  end
end
