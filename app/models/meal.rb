class Meal < ApplicationRecord
  belongs_to :user
  belongs_to :offer
  has_one_attached :photo

  validates :name, presence: true
  validates :category, presence: true
end
