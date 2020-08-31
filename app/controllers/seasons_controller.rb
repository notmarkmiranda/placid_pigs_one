class SeasonsController < ApplicationController
  include DateHelper

  before_action :authenticate_user!

  def show
    @season = Season.find(params[:id]).decorate
    authorize @season
    end_date = determine_end_date
    @current_week = (today..end_date).to_a
    @all_picks = Pick.where(game_week_id: @season.game_weeks.map(&:id))
  end

  def new
    @league = League.find(params[:league_id])
    @season = @league.seasons.new
    authorize @season
  end

  def create
    league = League.find(season_params[:league_id])
    @season = league.seasons.new(season_params)
    authorize @season
    if @season.save
      redirect_to @season
    else
      render :new
    end
  end

  def edit
    @season = Season.find(params[:id])
    authorize @season
  end

  def update
    @season = Season.find(params[:id])
    authorize @season
    if @season.update(season_params)
      redirect_to @season
    else
      render :edit
    end
  end

  def destroy
    @season = Season.find(params[:id])
    authorize @season
    @league = @season.league
    @season.destroy!
    redirect_to @league
  end

  private

  def determine_end_date
    max_end_date = today + @season.increment_lock.days
    max_end_date > @season.end_date ? @season.end_date : max_end_date
  end

  def season_params
    params.require(:season).permit(:name, :active, :league_id, :start_date, :end_date, :increment_lock, :offset)
  end
end
