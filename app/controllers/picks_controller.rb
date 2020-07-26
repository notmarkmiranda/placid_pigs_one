class PicksController < ApplicationController
  before_action :authenticate_user!

  def create
    @season = Season.find(pick_params[:season_id])
    @pick = current_user.picks.new(pick_params)
    authorize @pick
    @pick.save
    redirect_to @season
  end

  def destroy
    pick = Pick.find(params[:id])
    season = pick.season
    pick.destroy!
    redirect_to season
  end

  private

  def pick_params
    params.require(:pick).permit(:season_id, :user_id, :date, :team_id)
  end
end
