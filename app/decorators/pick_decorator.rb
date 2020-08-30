class PickDecorator < ApplicationDecorator
  include DateHelper

  delegate_all

  def last_updated_date_and_time
    return "never" unless pick
    updated_time(pick.updated_at)
  end
end
