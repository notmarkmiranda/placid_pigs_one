class StandingsController < ApplicationController
  def show
    @season = Season.find(params[:id])
    authorize(@season)
    @standings = @season.standings.decorate
  end
end
