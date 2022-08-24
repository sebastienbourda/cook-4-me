class Review < ApplicationRecord
  belongs_to :booking

  validates :rating, presence: true, numericality: { in: 1..5 }
  validates :comment, presence: true
end
