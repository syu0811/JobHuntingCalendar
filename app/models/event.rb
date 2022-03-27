class Event < ApplicationRecord
  belongs_to :user
  belongs_to :company

  validates :title, presence: true, length: { maximum: 30 }
  validates :year, presence: true, inclusion: { in: 2000..2100 }
  validates :month, presence: true, inclusion: { in: 1..12 }
  validates :day, presence: true, inclusion: { in: 1..31 }, uniqueness: { scope: [:user_id, :year, :month] }
  validates :company_id, presence: true
  validates :user_id, presence: true
end
