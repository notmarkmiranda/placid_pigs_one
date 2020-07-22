require "rails_helper"

describe HomeController, type: :request do
  describe "GET#index" do
    subject(:get_index) { get root_path }

    it "has 200 status" do
      get_index

      expect(response).to have_http_status(200)
    end
  end
end
