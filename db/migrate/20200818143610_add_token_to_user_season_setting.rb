class AddTokenToUserSeasonSetting < ActiveRecord::Migration[6.0]
  def change
    add_column :user_season_settings, :unsubscribe_token, :string
    add_index :user_season_settings, :unsubscribe_token, unique: true
  end
end
