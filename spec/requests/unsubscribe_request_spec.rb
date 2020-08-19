require "rails_helper"

describe UnsubscribeController, type: :request do
  describe "GET reminders" do
    let(:uss) { create(:user_season_setting, reminder_emails: true) }
    subject(:get_reminders) { get unsubscribe_path(token: uss.unsubscribe_token) }

    it "has 200 status" do
      get_reminders

      expect(response).to have_http_status(200)
    end

    it "changes reminder_emails from true to false" do
      expect {
        get_reminders
      }.to change {
        uss.reload
        uss.reminder_emails
      }
    end
  end
end
