class StandingsController < ApplicationController
  def show
    @season = Season.find(params[:id])
    authorize(@season)
    @standings = @season.full_stats_standings
  end
end
