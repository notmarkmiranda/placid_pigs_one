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
end
