FactoryBot.define do
  factory :pick do
    season 
    user 
    team
    date { Date.new(2020, 7, 23) }
  end
end
