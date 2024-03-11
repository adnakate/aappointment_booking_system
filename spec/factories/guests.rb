FactoryBot.define do
  sequence :email_2 do |n|
    charset = Array('A'..'Z') + Array('a'..'z') + Array(0..9)
    email = Array.new(16) { charset.sample }.join
    "#{email}@example.com"
  end
end

FactoryBot.define do
  factory :guest do
    first_name 'Abhijit'
    last_name 'Abhijit'
    email_2
  end
end
