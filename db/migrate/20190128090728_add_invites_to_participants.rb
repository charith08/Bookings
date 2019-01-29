class AddInvitesToParticipants < ActiveRecord::Migration[5.2]
  def change
      add_column :participants, :sender_id, :integer
      add_column :participants, :invitation_digest, :string
  end
end
