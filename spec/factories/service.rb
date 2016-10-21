require 'factory_girl_rails'

FactoryGirl.define do
  factory :service do
    sequence(:name) { |n| "service #{n}" }
    sequence(:description) { |n| "#{n} description" }
    price "9.99"
    time "10"
  end
end
