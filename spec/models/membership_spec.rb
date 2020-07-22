require "rails_helper"

describe Membership, type: :model do
  describe "validations" do
    let(:enum_values) { [:member, :admin, :superadmin] }

    it { should define_enum_for(:role).with_values(enum_values) }
  end

  describe "relationships" do
    it { should belong_to :user }
    it { should belong_to :league }
  end

  describe "methods"
end
