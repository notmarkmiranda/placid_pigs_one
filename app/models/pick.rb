class Pick < ApplicationRecord
  belongs_to :season
  belongs_to :user
  belongs_to :team

  validates_uniqueness_of :season_id, scope: [:user_id, :date]
end
