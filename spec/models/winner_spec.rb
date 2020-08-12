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

  describe "methods" do
    describe ".exists_for_date?" do
      let(:winner) { create(:winner) } 
      let(:team) { winner.team }
      let(:date) { winner.date }
      let(:status) { winner.status }

      subject { Winner.exists_for_date?(team, date, status) }

      it "returns true" do
        expect(subject).to be_truthy
      end

      describe "for the wrong date" do
        let(:date) { winner.date.tomorrow }

        it "returns nil" do
          expect(subject).to be_nil
        end
      end
    end
  end
end
