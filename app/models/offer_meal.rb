class OfferMeal < ApplicationRecord
  belongs_to :offer
  belongs_to :meal
end
