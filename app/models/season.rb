class Season < ApplicationRecord
  belongs_to :league

  validates_presence_of :name
  validates_uniqueness_of :name, scope: :league_id
  validates_presence_of :start_date
  validates_presence_of :end_date

  def all_dates
    (start_date..end_date).to_a
  end
end
