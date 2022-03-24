FactoryBot.define do
  factory :user do
    sequence(:email) { |_n| "test@example.com" }
    password { 'password' }
    password_confirmation { 'password' }
    confirmed_at { Time.zone.now }
  end
end
