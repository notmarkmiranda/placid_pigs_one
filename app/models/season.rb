class Season < ApplicationRecord
  belongs_to :league
  has_many :game_weeks, dependent: :destroy

  validates_presence_of :name
  validates_uniqueness_of :name, scope: :league_id
  validates_presence_of :start_date
  validates_presence_of :end_date

  after_create_commit :create_game_weeks

  def all_dates
    (start_date..end_date).to_a
  end

  private

  def create_game_weeks
    number_of_gws = (end_date - start_date + 1).to_i / increment_lock
    number_of_gws.times do |n|
      gw_start_date = start_date + increment_lock * n
      gw_end_date = gw_start_date + (increment_lock - 1)
      game_weeks.create!(start_date: gw_start_date, end_date: gw_end_date)
    end
  end
end
