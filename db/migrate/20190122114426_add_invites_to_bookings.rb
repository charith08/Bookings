class AddInvitesToBookings < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :booking_id, :integer
  end
end
