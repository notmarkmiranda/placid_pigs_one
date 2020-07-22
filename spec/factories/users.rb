FactoryBot.define do
  factory :user, aliases: [:owner] do
    sequence :email do |n|
      "test#{n}@example.com"
    end
    password { "password" }
  end
end
