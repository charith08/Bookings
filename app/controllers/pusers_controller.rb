class PusersController < ApplicationController


  # GET /pusers
  # GET /pusers.json
  def index

  end

  # GET /pusers/1
  # GET /pusers/1.json
  def show
  end

  # GET /pusers/new
  def new

  end

  # GET /pusers/1/edit
  def edit
  end

  def create
  end

  def yes
    puser=Puser.find_by(booking_id: params[:booking_id])
    participantno=Participant.find_by(user_id: params[:user_id])
    participantno.update_column(:status, "Confirmed")
    puser.update_column(:status, "Accepted")
    end


def no
  puser=Puser.find_by(booking_id: params[:booking_id])
  participantno=Participant.find_by(user_id: params[:user_id])
  participantno.update_column(:status, "Declined")
  puser.update_column(:status, "Declined")
  end



end
  # POST /pusers
  # POST /pusers.json
