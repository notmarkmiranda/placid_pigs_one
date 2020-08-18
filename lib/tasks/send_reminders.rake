desc "Sends reminder e-mails for locking picks"
task :send_reminders, [:email] => :environment do |t, args|
  if args[:email]
    user = User.find_by(email: args[:email])
    next unless user
    season = Season.first
    ReminderMailer.with(user: user, season: season).send_reminder.deliver_now
  else
    tomorrow = DateTime.now.in_time_zone("America/Denver").to_date.tomorrow
    seasons = Season.where(active: true)
    seasons.each do |season|
      league = season.league
      game_week_starts_tomorrow = GameWeek.find_by(season: season, start_date: tomorrow)
      next unless game_week_starts_tomorrow
      recipients = UserSeasonSetting.where(season: season, reminder_emails: true)
      recipients.each do |recipient|
        ReminderMailer
          .with(user: recipient.user, season: season)
          .send_reminder
          .deliver_now
      end
    end
  end
end
