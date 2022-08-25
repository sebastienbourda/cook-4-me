class CreateOfferMeals < ActiveRecord::Migration[7.0]
  def change
    create_table :offer_meals do |t|
      t.references :offer, null: false, foreign_key: true
      t.references :meal, null: false, foreign_key: true

      t.timestamps
    end
  end
end
