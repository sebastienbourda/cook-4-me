class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :offer
  has_many :reviews

  validates :date, presence: true
  validates :number_of_guests, presence: true
  validates :status, presence: true
end
