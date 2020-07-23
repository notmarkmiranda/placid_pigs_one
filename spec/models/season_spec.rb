require 'rails_helper'

describe Season, type: :model do
  describe 'validations' do
    before { create(:season) }
    it { should validate_presence_of :name }
    it { should validate_uniqueness_of(:name).scoped_to(:league_id) }
  end

  describe 'relationships' do
    it { should belong_to :league }
  end

  describe 'methods'
end
