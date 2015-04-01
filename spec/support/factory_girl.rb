require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
    user_type "member"
  end

  factory :vendor do
    sequence(:vendor_name) { |n| "Vendor #{n}" }
    sequence(:owner_id) { |n| n }
    viewable true
  end
end
