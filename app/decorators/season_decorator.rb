class SeasonDecorator < ApplicationDecorator
  include DateHelper

  delegate_all

  def formatted_start_date
    formatted_date(start_date)
  end

  def formatted_end_date
    formatted_date(end_date)
  end
end
