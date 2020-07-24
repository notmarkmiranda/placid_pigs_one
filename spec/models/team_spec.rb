require 'rails_helper'

describe Team, type: :model do
  describe "methods" do
    describe "#full_name" do
      let(:team) { Team.new(abbreviation: "LAD", city: "Los Angeles", name: "Dodgers") }

      it "shows a team's full name" do
        expect(team.full_name).to eq("Los Angeles Dodgers")
      end
    end
  end
end
