class AcceptInvitationsController < ApplicationController
  def edit
    puser=Puser.find_by(booking_id: params[:booking_id])
    participant = Participant.find_by(invitation_digest: params[:invitation_digest])
    #participantno=Participant.find_by(user_id: params[:user_id])
    participant.update_attribute(:status, true)
    #puser.update_column(:status, "Accepted")
    redirect_to users_path
    flash[:success] = "Accepted!"
  end
end
