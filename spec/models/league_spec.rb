require "rails_helper"

describe League, type: :model do
  describe "validations" do
    before { create(:league) }

    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name).case_insensitive }
  end

  describe "relationships" do
    it { should belong_to :owner }
    it { should have_many :memberships }
    it { should have_many :seasons }
  end

  describe "methods" do
    let(:league) { create(:league) }

    describe "#role_for_user" do
      subject { league.role_for_user(user) }

      describe "for non-member" do
        let(:user) { create(:user) }

        it "returns nil" do
          expect(subject).to eq(nil)
        end
      end

      describe "for member" do
        let(:membership) { create(:membership, league: league, role: 1) }
        let(:user) { membership.user }

        it "returns the role" do
          expect(subject).to eq("admin")
        end
      end
    end
  end
end
