class TeamDecorator < ApplicationDecorator
  delegate_all

  def full_name
    "#{city} #{name}"
  end

  def most_picked_team_and_count
    "#{team.abbreviation} - #{team.pick_count}"
  end
end
