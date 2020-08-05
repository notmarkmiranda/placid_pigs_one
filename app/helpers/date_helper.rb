module DateHelper
  def formatted_date_with_day(date)
    date.strftime("%A, %B %e, %Y")
  end

  def formatted_date(date)
    date.strftime("%B %e, %Y")
  end

  def season_days(season)
    (season.end_date - season.start_date).to_i + 1
  end
end
