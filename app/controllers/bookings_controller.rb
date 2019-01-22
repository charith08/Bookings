class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  # GET /bookings
  # GET /bookings.json
  def index
    @bookings = Booking.where(user_id:params[:user_id]).to_ary
  end

  # GET /bookings/1
  # GET /bookings/1.json
  def show
  end

  # GET /bookings/new
  def new
    @booking = Booking.new
  end

  # GET /bookings/1/edit
  def edit
  end

  # POST /bookings
  # POST /bookings.json
  def create
    @booking = Booking.new(booking_params)
    respond_to do |format|
      if (is_date_time_valid? @booking)
        if(is_available? @booking)
          if @booking.save
            format.html { redirect_to @booking, notice: 'Booking was successfully created' }
            format.json { render :show, status: :created, location: @booking }
          else
            format.html { render :new }
            format.json { render json: @booking.errors, status: :unprocessable_entity }
          end
        else
            flash.now[:danger] = 'This time period is not available'
            format.html { render :new }
            format.json { render json: @booking.errors, status: :unprocessable_entity }
        end
      else
        flash.now[:danger] = @invalid_reason
        format.html { render :new }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end

  end

  # PATCH/PUT /bookings/1
  # PATCH/PUT /bookings/1.json
  def update
    @booking.update(booking_params)
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
    @booking.destroy
    respond_to do |format|
      format.html { redirect_to user_bookings_url, notice: 'Booking was successfully deleted.' }
      format.json { head :no_content }
    end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def booking_params
      params.require(:booking).permit(:user_id, :room_id, :start_time, :end_time)
    end


    def is_available?(new_booking)
      puts "Enter is_available?"
      @conflict_bookings = [];
      @invalid_reason1=""
      is_available_flag = true;
      allBookings = Booking.where(room_id: new_booking.room_id).to_ary();
      puts allBookings.length
      allBookings.each { |this_booking|
            puts "check booking #{this_booking.id}"
        if(new_booking.id!=this_booking.id)
          if((this_booking.start_time < new_booking[:end_time]&& this_booking.end_time > new_booking[:start_time]) || ( this_booking.start_time< new_booking[:end_time]&&this_booking.end_time > new_booking[:start_time] ) )
             @conflict_bookings << this_booking
             @invalid_reason1 = "Time period is not available"
             is_available_flag = false
          end
        end
      }
      puts is_available_flag
     return is_available_flag
    end




    def is_date_time_valid?(new_booking)
      puts "Enter is_date_time_valid?"
      is_date_time_valid = true
      @invalid_reason=""
      puts "#{new_booking[:start_time]}"
      puts "#{new_booking[:end_time]}"
      puts "#{Time.current}"
      if(new_booking[:start_time].to_time.hour<9 || new_booking[:end_time].to_time.hour>20 )
        @invalid_reason = "only from 9am to 8pm"
        is_date_time_valid=false
      end

      if(new_booking[:start_time] < Time.current||new_booking[:end_time]<Time.current)
        @invalid_reason = "Selected booking time period is same/past."
        is_date_time_valid=false
      end
      if(new_booking[:end_time] < new_booking[:start_time] )
        @invalid_reason = "End time is earlier than start time  "
        is_date_time_valid=false
      end

      if(new_booking[:end_time] < new_booking[:start_time] + 30.minutes)
        @invalid_reason = "Minimun time is 30 min"
        is_date_time_valid=false
      end

      puts is_date_time_valid
      return is_date_time_valid
    end

     # Returns true if the room is available during selected time, , false otherwise.

end
