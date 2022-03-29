class Company < ApplicationRecord
  belongs_to :user
  has_many :events, dependent: :destroy

  validates :name, presence: true, length: { maximum: 20 }
  validates :user_id, presence: true
end
