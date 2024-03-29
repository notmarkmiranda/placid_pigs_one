class League < ApplicationRecord
  belongs_to :owner, class_name: "User", foreign_key: "user_id"
  has_many :memberships, dependent: :destroy
  has_many :seasons

  after_create_commit :create_admin_membership

  validates_presence_of :name
  validates_uniqueness_of :name, case_sensitive: false

  def role_for_user(user)
    memberships.find_by(user: user)&.role
  end

  private

  def create_admin_membership
    memberships.create(user_id: user_id, role: 1)
  end
end
