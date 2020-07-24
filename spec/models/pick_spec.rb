require "rails_helper"

describe Pick, type: :model do
  describe "relationships" do
    it { should belong_to :season }
    it { should belong_to :user }
    it { should belong_to :team }
  end

  describe "validations" do
    before { create(:pick) }

    it { should validate_uniqueness_of(:season_id).scoped_to(:user_id, :date) }
  end

  describe "methods"
end
