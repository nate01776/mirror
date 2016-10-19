require 'factory_girl_rails'

FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user_email#{n}@gmail.com" }
    sequence(:username) { |n| "user#{n}" }
    password "tester_password"
    sequence(:first_name)
    sequence(:last_name)
  end
end
