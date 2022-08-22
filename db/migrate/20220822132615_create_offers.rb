class CreateOffers < ActiveRecord::Migration[7.0]
  def change
    create_table :offers do |t|
      t.string :title
      t.string :type
      t.string :price_per_person
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
