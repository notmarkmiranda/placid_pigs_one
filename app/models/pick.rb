class Pick < ApplicationRecord
  belongs_to :game_week
  delegate :season, to: :game_week
  belongs_to :user
  belongs_to :team

  validates_uniqueness_of :game_week_id, scope: [:user_id, :date]
  validates_uniqueness_of :team_id, scope: [:user_id, :game_week_id]
  validates_presence_of :date

  def self.by_date(date, user_id=nil)
    if user_id
      find_by(date: date, user_id: user_id)
    else
      find_by(date: date)
    end
  end
end
