require "rails_helper"

describe Admin::WinnersController, type: :request do
  let(:membership) { create(:membership, role: 2) }
  let(:user) { membership.user }

  before { login_as(user) }

  describe 'GET#index' do
    subject(:get_index) { get admin_winners_path }

    it 'has 200 status' do
      get_index

      expect(response).to have_http_status(200)
    end
  end

  describe "POST#create" do
    let(:team) { create(:team) }
    let(:winner_attrs) { { winner: attributes_for(:winner).merge(team_id: team.id) } }
    subject(:post_create) { post admin_winners_path, params: winner_attrs }

    it "has 302 status" do
      post_create

      expect(response).to have_http_status(302)
    end

    it "creates a new winner" do
      expect {
        post_create
      }.to change(Winner, :count).by(1)
    end
  end
end
