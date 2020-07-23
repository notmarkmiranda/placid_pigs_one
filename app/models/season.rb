class Season < ApplicationRecord
  belongs_to :league

  validates_presence_of :name
  validates_uniqueness_of :name, scope: :league_id
end
