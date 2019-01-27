class ParticipantsController < ApplicationController
  #before_action :set_participant, only: [:show, :edit, :update, :destroy]



  # GET /participants
  # GET /participants.json


  # GET /participants/1
  # GET /participants/1.json
  def show
  end

  # GET /participants/new

    def new
    end



  # GET /participants/1/edit


  # POST /participants
  # POST /participants.json
  def create

    room = Room.find(params[:room_id])
    booking = Booking.find(params[:booking_id])
    user = User.find(params[:user_id])
    count = booking.participantCount
    if booking.participantCount<room.capacity
      if booking.participants.exists?(user_id: user.id)
        flash[:danger]= "User  is already Added"
        redirect_back(fallback_location: root_path)
      else
        booking.update_column(:participantCount, (count+1))
        @participants = booking.participants.create(:user_id => params[:user_id])
        @pusers= user.pusers.create(:booking_id => params[:booking_id])

        flash[:success]= "User is been added"
        redirect_back(fallback_location: root_path)
      end
    else
      flash[:danger]= "Maximum Capacity is reached"
      redirect_back(fallback_location: root_path)
    end

  end


  # PATCH/PUT /participants/1
  # PATCH/PUT /participants/1.json


end