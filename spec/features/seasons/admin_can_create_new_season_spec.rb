require "rails_helper"

describe "Admin can create new season", type: :feature do
  let(:membership) { create(:membership, role: 1) }
  let(:user) { membership.user }
  let(:league) { membership.league }

  before { login_as(user, scope: :user) }

  it "creates a new season and redirects to that season" do
    visit new_season_path(league_id: league.id)

    fill_in "Season Name", with: "Super Duper"
    fill_in "Start Date", with: "09/05/2020"
    fill_in "End Date", with: "10/05/2020"
    click_button "Create Season"

    expect(current_path).to eq(season_path(Season.last))
    expect(page).to have_content(Season.last.name)
  end
end
