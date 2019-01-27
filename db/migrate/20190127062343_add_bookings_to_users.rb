class AddBookingsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :booking_id, :integer
  end
end
