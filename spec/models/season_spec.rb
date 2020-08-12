require "rails_helper"

describe Season, type: :model do
  describe "validations" do
    before { create(:season) }
    it { should validate_presence_of :name }
    it { should validate_uniqueness_of(:name).scoped_to(:league_id) }
    it { should validate_presence_of(:start_date) }
    it { should validate_presence_of(:end_date) }
  end

  describe "relationships" do
    it { should belong_to :league }
    it { should have_many :game_weeks }
  end

  describe "methods" do
    let(:start_date) { Date.new(2020, 1, 1) }
    let(:season) { create(:season, start_date: start_date, end_date: Date.new(2020, 1, 3)) }

    describe "#all_dates" do
      subject { season.all_dates }
      it "returns array inclusive of start and end dates" do
        expect(subject.count).to eq(3) 
      end

      it "returns array of date objects" do
        expect(subject.first).to eq(start_date)
      end
    end

    describe "#other_users" do
      subject(:season_other_users) { season.other_users(user_one) }

      let(:league) { season.league }
      let!(:user_one) { season.league.owner }

      describe "when only one user exists" do
          it "returns empty array" do
            expect(season_other_users).to eq([])
          end
      end

      describe "with multiple users" do
        let(:membership_two) { create(:membership, league: league) } 
        let!(:user_two) { membership_two.user }

        it "returns array of another user" do
          expect(season_other_users.count).to eq(1)
        end
      end
    end

    pending "#standings"
  end
end
