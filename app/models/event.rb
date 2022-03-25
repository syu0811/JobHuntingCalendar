class Event < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, length: { maximum: 30 }
  validates :year, presence: true, inclusion: { in: 2000..2100 }, numericality: true
  validates :month, presence: true, inclusion: { in: 1..12 }, numericality: true
  validates :day, presence: true, inclusion: { in: 1..31 }, numericality: true
  validates :user_id, presence: true
end
