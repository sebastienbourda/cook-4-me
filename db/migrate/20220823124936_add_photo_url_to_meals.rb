class AddPhotoUrlToMeals < ActiveRecord::Migration[7.0]
  def change
    add_column :meals, :photo_url, :string
  end
end
