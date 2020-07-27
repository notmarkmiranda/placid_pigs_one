require "rails_helper"

describe GameWeek, type: :model do
  describe "relationships" do
    it { should belong_to :season }
    it { should have_many :picks }
  end
end
