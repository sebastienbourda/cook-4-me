class AddChefLocationToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :chef_location, :string
  end
end
