class UserDecorator < ApplicationDecorator
  delegate_all

  def identifier
    if user.first_name && user.last_name
      "#{user.first_name} #{user.last_name[0]}"
    elsif record.first_name
      "#{user.first_name}"
    else
      "something"
    end
  end
end