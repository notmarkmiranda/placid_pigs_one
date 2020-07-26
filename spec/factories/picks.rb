FactoryBot.define do
  factory :pick do
    game_week
    user
    team
    date { Date.new(2020, 7, 23) }
  end
end
