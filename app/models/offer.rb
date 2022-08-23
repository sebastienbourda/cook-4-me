class Offer < ApplicationRecord
  belongs_to :user
  has_many :meals

  validates :title, presence: true
  validates :category, presence: true
  validates :price_per_person, presence: true
end
