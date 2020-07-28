class Admin::WinnersController < ApplicationController
  before_action :require_admin!

  def index
    earliest_date = GameWeek.order(:start_date, :id).limit(1).first&.start_date
    latest_date = GameWeek.order(:end_date, :id).limit(1).first&.end_date
    @all_dates = (earliest_date..latest_date).to_a if earliest_date
  end
end
