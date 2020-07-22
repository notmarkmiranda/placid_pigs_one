class LeaguesController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def new
  end

  def create
    @league = current_user.leagues.new(league_params)
    if @league.save
      redirect_to @league
    end
  end

  private

  def league_params
    params.require(:league).permit(:name)
  end
end
