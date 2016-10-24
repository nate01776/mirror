require 'factory_girl_rails'

FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user_email#{n}@gmail.com" }
    sequence(:username) { |n| "user#{n}" }
    password "tester_password"
    sequence(:first_name) { |n| "name#{n}" }
    sequence(:last_name) { |n| "last#{n}" }
  end
end
