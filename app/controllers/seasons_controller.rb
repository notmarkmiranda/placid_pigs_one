class SeasonsController < ApplicationController
  before_action :authenticate_user!

  def show
    @season = Season.find(params[:id])
    authorize @season
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
    params.require(:season).permit(:name, :active, :league_id)
  end
end
