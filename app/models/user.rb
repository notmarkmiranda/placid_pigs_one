class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable

  attr_accessor :total_pick_count, :nil_pick_count 
  has_many :leagues
  has_many :seasons, through: :leagues
  has_many :memberships
  has_many :picks

  def active_seasons
    seasons.where(active: true)
  end

  def user_leagues
    memberships.map(&:league)
  end

  def superadmin?
    memberships.where(role: :superadmin).any?
  end
end
