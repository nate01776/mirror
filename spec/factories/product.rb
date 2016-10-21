require 'factory_girl_rails'

FactoryGirl.define do
  factory :product do
    sequence(:name) { |n| "product #{n}" }
    sequence(:description) { |n| "#{n} description" }
  end
end
