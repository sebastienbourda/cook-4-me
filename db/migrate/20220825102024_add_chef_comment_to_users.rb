class AddChefCommentToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :chef_comment, :text
  end
end
