class Review < ApplicationRecord
  belongs_to :booking
  has_one_attached :photo

  validates :rating, presence: true, numericality: { in: 1..5 }
  validates :comment, presence: true
end
