class RenameTypeColumnToOffer < ActiveRecord::Migration[7.0]
  def change
    remove_column :offers, :type, :string
    add_column :offers, :category, :string
  end
end
