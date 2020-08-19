class UserSeasonSetting < ApplicationRecord
  has_secure_token :unsubscribe_token
  validates_uniqueness_of :user_id, scope: :season_id
  belongs_to :user
  belongs_to :season
end
