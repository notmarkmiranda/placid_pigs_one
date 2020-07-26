class SeasonDecorator < ApplicationDecorator
  delegate_all

  def formatted_start_date
    formatted_date(start_date)
  end

  def formatted_end_date
    formatted_date(end_date)
  end

  private

  def formatted_date(date)
    date.strftime("%B %e, %Y")
  end
end
