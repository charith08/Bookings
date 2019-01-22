class FixColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :bookings, :start, :start_time
  rename_column :bookings, :end, :end_time
  end
end
