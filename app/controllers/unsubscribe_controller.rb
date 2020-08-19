class UnsubscribeController < ApplicationController
  def reminders
    uss = UserSeasonSetting.find_by(unsubscribe_token: params[:token])
    uss.update(reminder_emails: false) if uss
    render :reminders
  end
end
