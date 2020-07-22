class League < ApplicationRecord
  belongs_to :owner, class_name: "User", foreign_key: "user_id"

  validates_presence_of :name
  validates_uniqueness_of :name, case_sensitive: false
end
