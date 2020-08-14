require "rails_helper"

describe PicksController, type: :request do
  let(:membership) { create(:membership) }
  let(:user) { membership.user }
  let(:league) { membership.league }
  let(:season) { create(:season, league: league) }
  let(:game_week) { create(:game_week, season: season) }
  let(:team) { create(:team) }

  before { sign_in(user) }

  describe "GET#index" do
    subject(:get_index) { get picks_path(season_id: season.id) }

    it "has 200 status" do
      get_index

      expect(response).to have_http_status(200)
    end
  end

  describe "POST#create" do
    subject(:post_create) { post picks_path, params: pick_attrs }

    describe "happy path" do
      let(:pick_attrs) { {pick: attributes_for(:pick).merge(game_week_id: game_week.id, team_id: team.id)} }

      it "has 302 status" do
        post_create

        expect(response).to have_http_status(302)
      end

      it "creates a new pick" do
        expect {
          post_create
        }.to change(Pick, :count).by(1)
      end
    end

    describe "sad path" do
      let(:pick_attrs) { {pick: {team_id: "", game_week_id: game_week.id}} }

      it "has 302 status" do
        post_create

        expect(response).to have_http_status(302)
      end

      it "does not create a new pick" do
        expect {
          post_create
        }.to change(Pick, :count).by(0)
      end
    end
  end

  describe "DELETE#destroy" do
    let!(:pick) { create(:pick, game_week: game_week) }
    subject(:delete_destroy) { delete pick_path(pick) }

    it "has 302 status" do
      delete_destroy

      expect(response).to have_http_status(302)
    end

    it "deletes a pick" do
      expect {
        delete_destroy
      }.to change(Pick, :count).by(-1)
    end
  end
end
