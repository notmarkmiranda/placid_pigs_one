class CreateUserSeasonSettings < ActiveRecord::Migration[6.0]
  def up
    create_table :user_season_settings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :season, null: false, foreign_key: true
      t.boolean :reminder_emails, default: true

      t.timestamps null: false
    end

    all_seasons = Season.all
    all_seasons.each do |season|
      league = season.league
      memberships = league.memberships

      memberships.each do |membership|
        UserSeasonSetting.find_or_create_by(user: membership.user, season: season)
      end
    end
  end

  def down
    drop_table :user_season_settings
  end
end
