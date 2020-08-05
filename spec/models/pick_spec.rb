require "rails_helper"

describe Pick, type: :model do
  describe "relationships" do
    it { should belong_to :game_week }
    it { should belong_to :user }
    it { should belong_to :team }
  end

  describe "validations" do
    before { create(:pick) }

    let(:enum_values) { [:winner, :loser] }

    it { should validate_uniqueness_of(:game_week_id).scoped_to(:user_id, :date) }
    it { should validate_uniqueness_of(:team_id).scoped_to(:user_id, :game_week_id) }
    it { should validate_presence_of(:date) }
    it { should define_enum_for(:status).with_values(enum_values) }
  end

  describe "methods"
end
