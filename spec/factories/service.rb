require 'factory_girl_rails'

FactoryGirl.define do
  factory :service do
    sequence(:name) { |n| "salon #{n}" }
    sequence(:address) { |n| "#{n}0 Fake St" }
    city "Boston"
    state "MA"
    zip_code "02134"
    email "test@gmail.com"
    phone "617-925-1122"
  end
end
