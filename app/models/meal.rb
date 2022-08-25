class Meal < ApplicationRecord
  belongs_to :user
  has_many :offer_meals
  has_many :offers, through: :offer_meals
  has_one_attached :photo

  validates :name, presence: true
  validates :category, presence: true
end
