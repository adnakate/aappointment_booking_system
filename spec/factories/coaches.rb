FactoryBot.define do
  sequence :email do |n|
    charset = Array('A'..'Z') + Array('a'..'z') + Array(0..9)
    email = Array.new(16) { charset.sample }.join
    "#{email}@example.com"
  end
end

FactoryBot.define do
  factory :coach do
    name 'Abhijit Nakate'
    association :time_zone
    email
  end
end
