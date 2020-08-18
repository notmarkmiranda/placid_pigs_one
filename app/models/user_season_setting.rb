class UserSeasonSetting < ApplicationRecord
  validates_uniqueness_of :user_id, scope: :season_id
  belongs_to :user
  belongs_to :season
end
