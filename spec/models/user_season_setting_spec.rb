require "rails_helper"

describe UserSeasonSetting, type: :model do
  describe "validations" do
    before { create(:user_season_setting) }

    it { should validate_uniqueness_of(:user_id).scoped_to(:season_id) }
  end

  describe "relationships" do
    it { should belong_to :user }
    it { should belong_to :season }
  end
end
