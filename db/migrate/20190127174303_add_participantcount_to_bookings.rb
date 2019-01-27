class AddParticipantcountToBookings < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :participantCount, :integer, :default => 0
  end
end
