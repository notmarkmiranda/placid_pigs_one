require "rails_helper"

describe "Admin can create new season", type: :feature do
  let(:membership) { create(:membership, role: 1) }
  let(:user) { membership.user }
  let(:league) { membership.league }

  before do
    travel_to Time.local(2020, 5, 9)
    login_as(user, scope: :user)
  end

  after do
    travel_back
  end

  it "creates a new season and redirects to that season" do
    visit new_season_path(league_id: league.id)

    fill_in "Season Name", with: "Super Duper"
    fill_in "Start Date", with: "09/05/2020"
    fill_in "End Date", with: "16/05/2020"
    click_button "Create Season"

    expect(current_path).to eq(season_path(Season.last))
    expect(page).to have_content(Season.last.name)
  end
end
