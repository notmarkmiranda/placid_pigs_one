class ReminderMailer < ApplicationMailer
  def send_reminder
    @user = params[:user]
    @season = params[:season]
    @recipient = params[:recipient]
    mail(to: @user.email, subject: "Picks are due tomorrow")
  end
end
