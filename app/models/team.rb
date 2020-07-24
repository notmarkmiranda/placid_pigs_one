class Team < ApplicationRecord
  def full_name
    "#{city} #{name}"
  end
end
