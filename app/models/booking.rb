class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :offer
  has_many :reviews, dependent: :destroy

  validates :date, presence: true
  validates :number_of_guests, presence: true, numericality: { greater_than: 0 }
  validates :status, presence: true

  enum status: { pending: 0, confirmed: 1, rejected: 2 }
end
