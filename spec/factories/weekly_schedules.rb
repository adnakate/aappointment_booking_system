FactoryBot.define do
  factory :weekly_schedule do
    association :coach
    day_of_week 0
    available_at '3:00PM'
    available_until '5:00PM'
  end
end
