FactoryBot.define do
  factory :company do
    name { 'ใในใ' }
    home_page_url { 'https://www.home.com/' }
    communication_url { 'https://www.communication.com/' }
    association :user
  end
end
