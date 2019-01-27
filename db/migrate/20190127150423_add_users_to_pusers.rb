class AddUsersToPusers < ActiveRecord::Migration[5.2]
  def change
    add_column :pusers, :user_id, :integer
  end
end
