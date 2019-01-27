class CreatePusers < ActiveRecord::Migration[5.2]
  def change
    create_table :pusers do |t|
      t.integer :booking_id
      t.string :status, default: "No Response"

      t.timestamps
    end
  end
end
