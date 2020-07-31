class Team < ApplicationRecord
  has_many :winners
  
  def full_name
    "#{city} #{name}"
  end
end
