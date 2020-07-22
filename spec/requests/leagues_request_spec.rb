require "rails_helper"

describe LeaguesController, type: :request do
  let(:user) { create(:user) }
  before { sign_in(user) }
  let(:membership) { create(:membership, user: user, role: 1) }
  let!(:league) { membership.league }

  describe "GET#index" do
    subject(:get_index) { get leagues_path }

    it "has 200 status" do
      get_index

      expect(response).to have_http_status(200)
    end
  end

  describe "GET#show" do
    subject(:get_show) { get league_path(league) }

    it "has 200 status" do
      get_show

      expect(response).to have_http_status(200)
    end
  end

  describe "GET#new" do
    subject(:get_new) { get new_league_path }

    it "has 200 status" do
      get_new

      expect(response).to have_http_status(200)
    end
  end

  describe "POST#create" do
    subject(:post_create) { post leagues_path, params: league_attrs }

    describe "happy path" do
      let(:league_attrs) { {league: attributes_for(:league)} }

      it "has 302 status" do
        post_create

        expect(response).to have_http_status(302)
      end

      it "creates a new league" do
        expect {
          post_create
        }.to change(League, :count).by(1)
          .and change(Membership, :count).by(1)
      end
    end

    describe "sad path" do
      let(:league_attrs) { {league: {name: ""}} }

      it "has 200 status" do
        post_create

        expect(response).to have_http_status(200)
      end

      it "does not create new league" do
        expect {
          post_create
        }.to change(League, :count).by(0)
      end
    end
  end

  describe "GET#edit" do
    subject(:get_edit) { get edit_league_path(league) }

    it "has 200 status" do
      get_edit

      expect(response).to have_http_status(200)
    end
  end

  describe "PUT#update" do
    subject(:put_update) { put league_path(league), params: league_attrs }

    describe "happy path" do
      let(:league_attrs) { {league: {name: "new name"}} }

      it "has 302 status" do
        put_update

        expect(response).to have_http_status(302)
      end

      it "updates league name" do
        expect {
          put_update
        }.to change {
          league.reload
          league.name
        }
      end
    end

    describe "sad path" do
      let(:league_attrs) { {league: {name: ""}} }

      it "has 200 status" do
        put_update

        expect(response).to have_http_status(200)
      end

      it "does not update league name" do
        expect {
          put_update
        }.not_to change {
          league.reload
          league.name
        }
      end
    end
  end

  describe "DELETE#destroy" do
    subject(:delete_destroy) { delete league_path(league) }

    it "has 302 status" do
      delete_destroy

      expect(response).to have_http_status(302)
    end

    it "deletes a league" do
      expect {
        delete_destroy
      }.to change(League, :count).by(-1)
    end
  end
end
