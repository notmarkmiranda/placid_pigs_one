require 'rails_helper'

describe LeaguesController, type: :request do
  let(:user) { create(:user) }
  before { sign_in(user) }

  describe 'GET#index' do
    subject(:get_index) { get leagues_path }

    it 'has 200 status' do
      get_index

      expect(response).to have_http_status(200)
    end
  end

  pending 'GET#show'

  describe "GET#new" do
    subject(:get_new) { get new_league_path }

    it "has 200 status" do
      get_new

      expect(response).to have_http_status(200)
    end
  end

  describe "POST#create" do
    subject(:post_create) { post leagues_path, params: league_attributes }

    describe "happy path" do
      let(:league_attributes) { { league: attributes_for(:league) } }

      it "has 302 status" do
        post_create

        expect(response).to have_http_status(302)
      end

      it "creates a new league" do
        expect {
          post_create
        }.to change(League, :count).by(1)
      end
    end

    describe "sad path" do
      let(:league_attributes) { { league: { name: '' } } }

      it "has 204 status" do
        post_create

        expect(response).to have_http_status(204)
      end

      it "does not create new league" do
        expect {
          post_create
        }.to change(League, :count).by(0)
      end
    end
  end

  pending 'PUT#update'

  pending 'DELETE#destroy'
end
