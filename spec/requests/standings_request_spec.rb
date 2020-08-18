require "rails_helper"

describe StandingsController, type: :request do
  let(:season) { create(:season) }
  let(:membership) { create(:membership, league: season.league) }
  let(:user) { membership.user }

  before { login_as(user) }

  describe "GET#show" do
    subject(:get_show) { get standings_season_path(season) }
    it "has 200 status" do
      get_show

      expect(response).to have_http_status(200)
    end
  end
end
