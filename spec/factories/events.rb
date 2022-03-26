FactoryBot.define do
  factory :event do
    title { 'テスト' }
    year { 2022 }
    month { 3 }
    day { 30 }
    url { 'https://www.google.com/' }
    association :company
    association :user
  end
end
