class PickDecorator < ApplicationDecorator
  include DateHelper

  delegate_all

  def last_updated_date_and_time
    updated_time(pick.updated_at.in_time_zone("America/Denver"))
  end
end
