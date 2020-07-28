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
end
