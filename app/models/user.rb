class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable

  has_many :leagues
  has_many :memberships
  has_many :picks

  def user_leagues
    memberships.map(&:league)
  end

  def superadmin?
    memberships.where(role: :superadmin).any?
  end
end
