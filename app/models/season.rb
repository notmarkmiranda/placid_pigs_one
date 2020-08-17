class Season < ApplicationRecord
  belongs_to :league
  has_many :game_weeks, dependent: :destroy

  validates_presence_of :name
  validates_uniqueness_of :name, scope: :league_id
  validates_presence_of :start_date
  validates_presence_of :end_date

  after_create_commit :create_game_weeks

  def all_dates
    (start_date..end_date).to_a
  end

  def other_users(user_id)
    users = UserDecorator.decorate_collection(league.memberships.where.not(user_id: user_id).map(&:user))
    users.sort_by { |u| u.email }
  end

  def points_for_user(user)
    standings.find(user.id).pick_count
  end

  def position_for_current_user(user)
    ordered_standings = standings
    index = ordered_standings.index(user) || 98
    { place: index + 1, object: ordered_standings[index]&.decorate }
  end

  def standings(limit=nil)
    User
      .joins(:picks)
      .where(picks: { status: :winner, game_week: game_weeks })
      .select('users.*, count(picks.id) as pick_count')
      .group('users.id')
      .order('count(picks.id) DESC')
      .limit(limit)
  end

  private

  def create_game_weeks
    create_short_week if offset > 0
    adjusted_start_date = start_date + offset
    n = 0
    loop do
      gw_start_date = adjusted_start_date + increment_lock * n
      calculated_end = gw_start_date + (increment_lock - 1)
      gw_end_date = verified_end_date(calculated_end, end_date)
      game_weeks.create!(start_date: gw_start_date, end_date: gw_end_date)
      break if calculated_end >= end_date
      n += 1
    end
  end

  def create_short_week
    game_weeks.create(start_date: start_date, end_date: start_date + (offset - 1))
  end

  def verified_end_date(calculated_end_date, season_end_date)
    calculated_end_date > season_end_date ? season_end_date : calculated_end_date
  end
end
