require "rails_helper"

describe GameWeek, type: :model do
  describe "relationships" do
    it { should belong_to :season }
    it { should have_many :picks }
  end

  describe "methods" do
    let(:game_week) do 
      create(
        :game_week, 
        start_date: Date.new(2020, 8, 24), 
        end_date: Date.new(2020, 8, 30)
      ) 
    end

    describe ".date_count" do
      subject(:gw_date_count) { game_week.date_count }
      
      it "returns the number of dates inclusive of the bookend dates" do
        expect(gw_date_count).to eq(7)
      end

      describe "on a game week with less than 7 days" do
        before { game_week.update(end_date: Date.new(2020, 8, 31)) }

        it "returns the number of dates inclusive of the bookend dates" do
          expect(gw_date_count).to eq(8)
        end
      end
    end
  end
end
