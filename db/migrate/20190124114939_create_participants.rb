class CreateParticipants < ActiveRecord::Migration[5.2]
  def change
    create_table :participants do |t|
      t.integer :user_id
      t.string :status, default: "No Response"

      t.timestamps
    end
  end
end
