require "rails_helper"

describe "User can create new league", type: :feature do
  let(:user) { create(:user) }

  before do
    login_as(user, scope: :user)
  end

  it "creates a new league and redirects to that league" do
    visit new_league_path

    fill_in "League Name", with: "Super Duper"
    click_button "Create League"

    expect(current_path).to eq(league_path(League.last))
    expect(page).to have_content(League.last.name)
  end
end
