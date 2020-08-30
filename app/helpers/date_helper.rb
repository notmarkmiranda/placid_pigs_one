module DateHelper
  def formatted_date_with_day(date)
    date&.strftime("%A, %B %e, %Y")
  end

  def formatted_date(date)
    date&.strftime("%B %e, %Y")
  end

  def short_date(date)
    date&.strftime("%m/%d/%Y")
  end

  def season_days(season)
    (season.end_date - season.start_date).to_i + 1
  end

  def today
    DateTime.now.in_time_zone("America/Denver").to_date
  end

  def today_with_day
    formatted_date_with_day(today)
  end

  def updated_time(date)
    "#{formatted_date(date)} at #{date.strftime('%l:%M %p')}"
  end
end
