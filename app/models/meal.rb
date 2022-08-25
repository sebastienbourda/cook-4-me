class Meal < ApplicationRecord
  CATEGORIES = %w[starter main dessert]
  belongs_to :user
  has_many :offer_meals, dependent: :destroy
  has_many :offers, through: :offer_meals
  has_one_attached :photo

  validates :name, presence: true
  validates :category, presence: true, inclusion: { in: CATEGORIES }
end
