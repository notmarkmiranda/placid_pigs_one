FactoryBot.define do
  factory :league do
    sequence :name do |n|
      "League #{n}"
    end
    owner
  end
end
