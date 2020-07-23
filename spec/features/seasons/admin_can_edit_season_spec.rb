require "rails_helper"

describe "Admin can edit season", type: :feature do
  let(:membership) { create(:membership, role: 1) }
  let(:user) { membership.user }
  let(:league) { membership.league }
  let(:season) { create(:season, league: league) } 
  let(:new_name) { "#{SecureRandom.hex(2)}" }

  before { login_as(user, scope: :user) }

  it "edits the season name" do
    visit edit_season_path(season)

    fill_in "Season Name", with: new_name
    click_button "Update Season"

    expect(current_path).to eq(season_path(season))
    expect(page).to have_content(new_name)
  end
end
