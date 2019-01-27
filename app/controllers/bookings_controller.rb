class BookingsController < ApplicationController
  #before_action :set_booking

  # GET /bookings
  # GET /bookings.json
  def index
    @bookings = Booking.where(user_id:params[:user_id])
  end

  def new
    @booking = Booking.new
  end

  # GET /bookings/1
  # GET /bookings/1.json
  def show
    @room=Room.find(params[:room_id])
    @bookings = @room.booking.find(params[:id])
  end

  def showParticipants
  @room=Room.find(params[:room_id])
  @booking = @room.booking.find(params[:id])
end

  # GET /bookings/new


  # GET /bookings/1/edit
  def edit
  end

  # POST /bookings
  # POST /bookings.json
  def create
    @room= Room.find(params[:room_id])
    @booking = @room.bookings.create(booking_params)

    if current_user.admin?
    else
      respond_to do |format|
        if @booking.save
          format.html { redirect_to rooms_path(@room), notice: 'Meeting is successfully created' }
          format.json { render :show, status: :created, location: rooms_path(@room) }

          else
            format.html { render :new }
            format.json { render json: @booking.errors, status: :unprocessable_entity }
          end
    end
  end


  end

  # PATCH/PUT /bookings/1
  # PATCH/PUT /bookings/1.json
  def update
    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to @booking, notice: 'Booking was successfully updated.' }
        format.json { render :show, status: :ok, location: @booking }
      else
        format.html { render :edit }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookings/1
  # DELETE /bookings/1.json
  def destroy
    @room = Room.find(params[:room_id])
   @booking = @room.booking.find(params[:id])
    respond_to do |format|
      format.html { redirect_to bookings_url, notice: 'Booking was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    #def set_booking
    #  @booking = Booking.find(params[:id])
    #end

    # Never trust parameters from the scary internet, only allow the white list through.
    def booking_params
      params.require(:booking).permit(:user_id, :name, :start_time, :end_time)
    end
end
