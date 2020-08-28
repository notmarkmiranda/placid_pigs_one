FactoryBot.define do
  factory :team do
    sequence(:city) { |n| "Los Angeles#{n}" }
    sequence(:name) { |n| "Dodgers#{n}" }
    sequence(:abbreviation) { |n| "LAD#{n}" }
  end
end
