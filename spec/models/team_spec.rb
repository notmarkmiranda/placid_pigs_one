require "rails_helper"

describe Team, type: :model do
  describe "relationships" do
    it { should have_many :winners }
    it { should have_many :picks }
  end

  describe "methods" do
    pending ".most_by_season_and_date"
  end
end
