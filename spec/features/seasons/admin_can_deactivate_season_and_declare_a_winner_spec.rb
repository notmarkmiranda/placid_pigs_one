require "rails_helper"

describe "Admin can deactivate season and declare a winner", type: :feature do
  let(:season) { create(:season, start_date: Date.new(2020, 8, 17), end_date: Date.new(2020, 8, 30)) } 
  let(:user) { season.league.owner }

  before do 
    travel_to Time.local(2020, 8, 23)
    login_as(user, scope: :user)
  end

  before do
    visit season_path(season)

    click_button("Finalize Season")
  end

  it "redirects to season path" do
    expect(current_path).to eq(season_path(season))
  end

  it "doesn't allow new picks to be chosen" do
    expect(page).not_to have_selector(".save-pick") 
  end
end
