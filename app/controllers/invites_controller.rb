class InvitesController < ApplicationController
  before_action :set_invite, only: [:show, :edit, :update, :destroy]

  # GET /invites
  # GET /invites.json
  def index
    @invites = Invite.where(user_id:params[:user_id]).to_ary
  end

  # GET /invites/1
  # GET /invites/1.json
  def show
  end

  # GET /invites/new
  def new
    @invite = Invite.new
  end

  # GET /invites/1/edit
  def edit
  end

  # POST /invites
  # POST /invites.json
  def create
    @invite = Invite.new(invite_params)
    @invite.sender_id = current_user.id # set the sender to the current user
      if @invite.save

        #if the user already exists
        if @invite.recipient != nil

      #send a notification email
        InviteMailer.existing_user_invite(@invite).deliver

      #Add the user to the user group
        @invite.recipient.bookings.push(@invite.booking)
      else
        InviteMailer.new_user_invite(@invite, new_user_booking_path(:invite_token => @invite.token)).deliver #send the invite data to our mailer to deliver the email
      end
      redirect_to @invite
      flash[:info] = "Invite link sent"

      else
        flash[:info] = "Failed to send an invite mail"
         #  creating an new invitation failed
      end
  end

  # PATCH/PUT /invites/1
  # PATCH/PUT /invites/1.json
  def update
    respond_to do |format|
      if @invite.update(invite_params)
        format.html { redirect_to @invite, notice: 'Invite was successfully updated.' }
        format.json { render :show, status: :ok, location: @invite }
      else
        format.html { render :edit }
        format.json { render json: @invite.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invites/1
  # DELETE /invites/1.json
  def destroy
    @invite.destroy
    respond_to do |format|
      format.html { redirect_to invites_url, notice: 'Invite was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invite
      @invite = Invite.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def invite_params
      params.require(:invite).permit(:user_id)
    end
end
