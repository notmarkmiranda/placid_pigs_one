require "rails_helper"

describe PicksController, type: :request do
  let(:membership) { create(:membership) }
  let(:user) { membership.user }
  let(:league) { membership.league }
  let(:season) { create(:season, league: league) }
  let(:team) { create(:team) }

  before { sign_in(user) }

  describe "POST#create" do
    subject(:post_create) { post picks_path, params: pick_attrs }

    describe "happy path" do
      let(:pick_attrs) { {pick: attributes_for(:pick).merge(season_id: season.id, team_id: team.id)} }

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
      let(:pick_attrs) { {pick: {team_id: "", season_id: season.id}} }

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
    let!(:pick) { create(:pick, season: season) }
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
