require "rails_helper"

describe Winner, type: :model do
  describe "relationships" do
    it { should belong_to :team }
  end
  
  describe "validations" do
    let(:enum_values) { [:no_status, :winner, :loser] }
    before { create(:winner) }

    it { should validate_uniqueness_of(:team_id).scoped_to(:date) }
    it { should define_enum_for(:status).with_values(enum_values) }
  end

  describe "methods"
end
