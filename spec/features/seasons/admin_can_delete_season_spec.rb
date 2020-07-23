require "rails_helper"

describe "Admin can delete season", type: :feature do
  let(:membership) { create(:membership, role: 1) }
  let(:user) { membership.user }
  let(:league) { membership.league }
  let(:season) { create(:season, league: league) }

  before { login_as(user, scope: :user) }

  it "deletes the season" do
    visit season_path(season)

    click_button "Delete Season"

    expect(current_path).to eq(league_path(league))
  end
end
