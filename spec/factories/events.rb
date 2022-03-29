FactoryBot.define do
  factory :event do
    title { 'テスト' }
    year { 2022 }
    month { 3 }
    day { 30 }
    hour { 7 }
    minute { 0 }
    url { 'https://www.google.com/' }
    association :company
    association :user
  end
end
