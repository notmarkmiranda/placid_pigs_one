class ReminderMailer < ApplicationMailer
  def send_reminder
    @user = params[:user]
    @season = params[:season]
    @season_url = season_url(params[:season])
    mail(to: @user.email, subject: "Picks are due tomorrow")
  end
end
