class Winner < ApplicationRecord
  belongs_to :team

  validates_uniqueness_of :team_id, scope: :date

  enum status: {no_status: 0, winner: 1, loser: 2}

  def self.exists_for_date?(team, date, status)
    find_by(team: team, date: date, status: status)
  end
end
