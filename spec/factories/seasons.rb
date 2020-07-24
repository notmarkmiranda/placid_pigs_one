FactoryBot.define do
  factory :season do
    sequence :name do |n|
      "Season#{n}"
    end
    league 
    active { true }
    start_date { Date.new(2015, 05, 9) }
    end_date { Date.new(2020, 05, 9) }
  end
end
