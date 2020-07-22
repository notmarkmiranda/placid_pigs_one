require "rails_helper"

describe "Admin can delete league", type: :feature do
  let(:membership) { create(:membership, role: 1) }
  let(:league) { membership.league }
  let(:user) { membership.user }

  before { login_as(user, scope: :user) }

  it "deletes league and redirects to dashboard path" do
    visit league_path(league)

    click_button "Delete League"

    expect(current_path).to eq(dashboard_path)
  end
end
