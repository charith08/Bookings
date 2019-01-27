class AddParticipantsToBookings < ActiveRecord::Migration[5.2]
  def change
    add_column :participants, :booking_id, :integer
  end
end
