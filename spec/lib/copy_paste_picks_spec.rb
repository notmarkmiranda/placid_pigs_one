require "rails_helper"
require "copy_paste_picks"

describe CopyPastePicks do
  include DateHelper

  let(:season) { create(:season, active: true, increment_lock: 7, start_date: Date.new(2020, 8, 17), end_date: Date.new(2020, 8, 30)) }
  let(:user) { season.league.owner }

  let!(:gw1) { season.game_weeks.first }

  let!(:gw2) { season.game_weeks.last }

  describe "#vamonos" do
    subject { described_class.vamonos(today) }

    describe "when there is a current game_week" do
      before do 
        gw1.all_dates.each do |date|
          create(:pick, user: user, date: date, game_week: gw1)
        end

        travel_to Time.local(2020, 8, 24, 10)
      end

      after { travel_back }

      it 'copies all 7 picks' do
        expect {
          subject
        }.to change(Pick, :count).by(7)
      end

      describe "when some picks already exist for the game_week" do
        before do
          gw2.all_dates[0..-3].each do |date|
            create(:pick, user: user, date: date, game_week: gw2)
          end
        end

        it 'copies 2 picks' do
          expect {
            subject
          }.to change(Pick, :count).by(2)
        end
      end
    end
  end
end
