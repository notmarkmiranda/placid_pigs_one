FactoryBot.define do
  factory :winner do
    team 
    date { Date.new(2020, 7, 23) }
    status { :winner }
  end
end
