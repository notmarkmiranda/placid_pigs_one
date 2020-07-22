require "rails_helper"

describe "Admin can edit league name", type: :feature do
  let(:membership) { create(:membership, role: 1) }
  let(:league) { membership.league }
  let(:user) { membership.user }
  let(:new_name) { "new super name asdf" }

  before { login_as(user, scope: :user) }

  it 'updates the league name and redirects to league path' do
    visit edit_league_path(league)

    fill_in "League Name", with: new_name
    click_button "Update League"

    expect(current_path).to eq(league_path(league))
    expect(page).to have_content(new_name)
  end
end
