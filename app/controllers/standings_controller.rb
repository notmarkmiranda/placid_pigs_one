class StandingsController < ApplicationController
  def show
    @season = Season.find(params[:id])
    authorize(@season)
    @standings = @season.standings
  end
end
