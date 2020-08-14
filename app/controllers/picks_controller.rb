class PicksController < ApplicationController
  include DateHelper

  before_action :authenticate_user!

  def index
    @season = Season.find(params[:season_id])
    @game_weeks = @season.game_weeks.order(start_date: :asc)
    @dates = (@season.start_date..@season.end_date).to_a
    @picks = current_user
      .picks
      .where(game_week: GameWeek.where(season_id: @season.id))
      .order(date: :asc)
  end

  def create
    @game_week = GameWeek.find(pick_params[:game_week_id])
    @pick = current_user.picks.new(pick_params)
    authorize @pick
    @pick.save
    anchor = formatted_date_with_day(@pick.date)&.parameterize&.underscore
    redirect_to season_path(@pick.season, anchor: anchor)
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
