FactoryBot.define do
  factory :season do
    sequence :name do |n|
      "Season#{n}"
    end
    league
    active { true }
    start_date { Date.new(2020, 7, 27) }
    end_date { Date.new(2020, 9, 27) }
  end
end
