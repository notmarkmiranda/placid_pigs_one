FactoryBot.define do
  factory :season do
    sequence :name do |n|
      "Season#{n}"
    end
    league 
    active { true }
  end
end
