class ChangeIngredientsToMeal < ActiveRecord::Migration[7.0]
  def change
    change_column :meals, :ingredients, :text
  end
end
