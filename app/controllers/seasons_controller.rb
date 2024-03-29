class SeasonsController < ApplicationController
  before_action :authenticate_user!

  def show
    @season = Season.find(params[:id]).decorate
    authorize @season
    today = DateTime.now.in_time_zone("America/Denver").to_date
    end_of_week = today + @season.increment_lock
    end_date = end_of_week > @season.end_date ? @season.end_date : end_of_week
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

  def season_params
    params.require(:season).permit(:name, :active, :league_id, :start_date, :end_date, :increment_lock, :offset)
  end
end
