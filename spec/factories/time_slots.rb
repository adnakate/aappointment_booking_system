FactoryBot.define do
  factory :time_slot do
    association :coach
    date '2024-03-14'
    start_time '7:00'
    end_time '7:30'
  end
end
