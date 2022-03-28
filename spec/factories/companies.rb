FactoryBot.define do
  factory :company do
    name { 'テスト' }
    home_page_url { 'https://www.home.com/' }
    communication_url { 'https://www.communication.com/' }
    association :user
  end
end
