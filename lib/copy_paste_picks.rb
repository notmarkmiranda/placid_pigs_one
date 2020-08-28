class CopyPastePicks
  def self.vamonos(today)
    new(today).lets_go!
  end

  def initialize(today)
    @game_weeks = GameWeek.where(start_date: today)
  end

  def lets_go!
    game_weeks.each do |gw|
      total_possible_picks = gw.date_count
      picks = Pick.where(game_week: gw)

      last_weeks_users = get_users(gw.previous)
      this_weeks_users = get_users(gw)

      this_week = User
        .unscoped
        .select('*')
        .from(this_weeks_users, :sub_query)
        .where(sub_query: { pick_count: total_possible_picks })
        
      users = last_weeks_users - this_week

      users.each do |user|
        pick_dates = picks.where(user: user).map(&:date)
        missed_dates = gw.all_dates - pick_dates
        increment = gw.season.increment_lock

        missed_dates.each do |date|
          previous_pick = Pick.find_by(date: date - increment.days, user: user)

          next unless previous_pick

          create_pick(previous_pick, date, gw)
        end
      end
    end
  end

  private

  attr_reader :game_weeks

  def create_pick(pick, date, game_week)
    pick.dup.tap do |new_pick|
      new_pick.status = nil
      new_pick.game_token = nil
      new_pick.date = date
      new_pick.game_week = game_week
      new_pick.save
    end
  end

  def get_users(game_week)
    User
      .joins(:picks)
      .group(:id)
      .select("users.*, count(picks.id) AS pick_count")
      .where("picks.game_week_id = ?", game_week)
  end
end
