require 'rails_helper'

describe League, type: :model do
  describe "validations" do
    before { create(:league) }

    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name).case_insensitive }
  end

  describe "relationships" do
    it { should belong_to :owner }
    it { should have_many :memberships }
  end

  describe "methods"
end
