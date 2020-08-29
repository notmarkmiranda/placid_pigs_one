class UserDecorator < ApplicationDecorator
  delegate_all

  def identifier
    if user.first_name && user.last_name
      "#{user.first_name} #{user.last_name[0]}"
    elsif record.first_name
      user.first_name.to_s
    else
      "something"
    end
  end

  def is_current_user?(user)
    "bg-dark text-white" if object == user
  end

  def stats
    percentage = user.total_pick_count.zero? ? 0.0 : user.pick_count / user.total_pick_count.to_f

    [
      "#{user.pick_count} / #{user.total_pick_count} ",
      "- #{percentage_helper(percentage)} ",
      "<br />#{h.pluralize(user.nil_pick_count, "pending pick")}"
    ].join.html_safe
    
  end

  private

  def percentage_helper(number)
    h.number_to_percentage((number * 1000).floor / 10.0, precision: 1)
  end
end
