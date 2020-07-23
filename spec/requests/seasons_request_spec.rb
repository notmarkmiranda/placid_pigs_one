require "rails_helper"

describe SeasonsController, type: :request do
  let(:membership) { create(:membership, role: 1) }
  let(:league) { membership.league }
  let(:user) { membership.user }
  let!(:season) { create(:season, league: league) }

  before { sign_in(user) }

  describe "GET#show" do
    subject(:get_show) { get season_path(season) }

    it "has 200 status" do
      get_show

      expect(response).to have_http_status(200)
    end
  end

  describe "GET#new" do
    subject(:get_new) { get new_season_path(league_id: league.id) }

    it "has 200 status" do
      get_new

      expect(response).to have_http_status(200)
    end
  end

  describe "POST#create" do
    subject(:post_create) { post seasons_path, params: season_attrs }

    describe "happy path" do
      let(:season_attrs) { { season: attributes_for(:season).merge(league_id: league.id) } }

      it "has 302 status" do
        post_create

        expect(response).to have_http_status(302)
      end

      it "creates a new season" do
        expect {
          post_create
        }.to change(Season, :count).by(1)
      end
    end

    describe "sad path" do
      let(:season_attrs) { { season: { name: '', league_id: league.id } } }

      it "has 200 status" do
        post_create

        expect(response).to have_http_status(200)
      end

      it "does not create a new season" do
        expect {
          post_create
        }.to change(Season, :count).by(0)
      end
    end
  end

  describe "GET#edit" do
    subject(:get_edit) { get edit_season_path(season) }

    it "has 200 status" do
      get_edit

      expect(response).to have_http_status(200)
    end
  end

  describe "PUT#update" do
    let(:season_attrs) { { season: { name: new_name } } }
    subject(:put_update) { put season_path(season), params: season_attrs }

    describe "happy path" do
      let(:new_name) { "#{SecureRandom.hex(2)}" }

      it "has 302 status" do
        put_update

        expect(response).to have_http_status(302)
      end

      it "updates season name" do
        expect {
          put_update
        }.to change {
          season.reload
          season.name
        }
      end
    end

    describe "sad path" do
      let(:new_name) { "" }

      it "has 200 status" do
        put_update

        expect(response).to have_http_status(200)
      end

      it "does not update season name" do
        expect {
          put_update
        }.not_to change {
          season.reload
          season.name
        }
      end
    end
  end

  describe "DELETE#destroy" do
    subject(:delete_destroy) { delete season_path(season) }

    it "has 302 status" do
      delete_destroy

      expect(response).to have_http_status(302)
    end

    it "deletes a season" do
      expect {
        delete_destroy
      }.to change(Season, :count).by(-1)
    end
  end
end
