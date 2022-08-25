class Offer < ApplicationRecord
  belongs_to :user
  has_many :meals
  has_many :bookings
  has_many :reviews, through: :bookings

  validates :title, presence: true
  validates :category, presence: true
  validates :price_per_person, presence: true
end
