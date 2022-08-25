class RemoveOfferIdFromMeals < ActiveRecord::Migration[7.0]
  def change
    remove_reference :meals, :offer, foreign_key: true, index: false
  end
end
