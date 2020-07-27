class GameWeek < ApplicationRecord
  belongs_to :season
  has_many :picks

  scope :chronological, -> { order(start_date: :asc) }

  def all_dates
    (start_date..end_date).to_a
  end

  def cutoff_time
    start_date.yesterday.to_datetime.in_time_zone("America/Denver").change(hour: 20)
  end


  def locked?
    DateTime.now.in_time_zone("America/Denver") > cutoff_time
  end

  def rowspan
    (end_date - start_date + 2).to_i
  end
end
