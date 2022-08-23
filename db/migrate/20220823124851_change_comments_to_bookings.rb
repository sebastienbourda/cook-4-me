class ChangeCommentsToBookings < ActiveRecord::Migration[7.0]
  def change
    change_column :bookings, :comments, :text
  end
end
