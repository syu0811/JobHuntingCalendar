class Company < ApplicationRecord
  belongs_to :user
  has_many :events

  validates :name, presence: true, length: { maximum: 20 }
  validates :user_id, presence: true
end
