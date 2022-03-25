FactoryBot.define do
  factory :company do
    name { 'テスト' }
    association :user
  end
end
