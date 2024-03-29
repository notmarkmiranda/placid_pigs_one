class GameWeek < ApplicationRecord
  belongs_to :season
  has_many :picks

  scope :chronological, -> { order(start_date: :asc) }

  def all_dates
    (start_date..end_date).to_a
  end

  def cutoff_time
    start_date.to_datetime.change(hour: 16).in_time_zone("America/Denver")
  end

  def date_count
    (end_date - start_date).to_i + 1
  end

  def locked?
    DateTime.now.in_time_zone("America/Denver") > cutoff_time
  end

  def previous
    season.game_weeks.find_by(end_date: start_date.yesterday)
  end

  def rowspan
    date_count + 1
  end

  def self.by_date(season, date)
    gws = season.game_weeks.where("start_date <= ? AND end_date >= ?", date, date)
    return unless gws.one?
    gws.first
  end
end
