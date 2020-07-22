class LeaguesController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def show
    @league = League.find(params[:id])
    authorize @league
  end

  def new
    @league = current_user.leagues.new
  end

  def create
    @league = current_user.leagues.new(league_params)
    if @league.save
      redirect_to @league
    else
      render :new
    end
  end

  def edit
    @league = League.find(params[:id])
    authorize @league
  end

  def update
    @league = League.find(params[:id])
    authorize @league
    if @league.update(league_params)
      redirect_to @league
    else
      render :edit
    end
  end

  def destroy
    league = League.find(params[:id])
    authorize league
    league.destroy!
    redirect_to dashboard_path
  end

  private

  def league_params
    params.require(:league).permit(:name)
  end
end
