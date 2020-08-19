desc "Create user season settings for all existing leagues"
task create_uss: :environment do
  Season.all.each do |season|
    memberships = season.league.memberships

    memberships.each do |membership|
      u = UserSeasonSetting.find_or_initialize_by(season: season, user: membership.user)
      u.regenerate_unsubscribe_token
      u.save
    end
  end
end
