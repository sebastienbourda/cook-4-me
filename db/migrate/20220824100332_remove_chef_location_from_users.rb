class RemoveChefLocationFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :chef_location, :string
  end
end
