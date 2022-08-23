class Meal < ApplicationRecord
  belongs_to :user
  belongs_to :offer

  validates :name, presence: true
  validates :category, presence: true
end
