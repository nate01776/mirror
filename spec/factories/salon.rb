require 'factory_girl_rails'

FactoryGirl.define do
  factory :salon do
    sequence(:name) { |n| "salon #{n}" }
    sequence(:username) { |n| "user#{n}" }
    password "tester_password"
    sequence(:first_name)
    sequence(:last_name)
  end
end
