require "rails_helper"

describe User, type: :model do
  describe "validations"

  describe "relationships" do
    it { should have_many :leagues }
    it { should have_many :memberships }
    it { should have_many :picks }
  end
end
