class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  helper_method :current_user, :signed_in?, :is_admin?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def signed_in?
    !!current_user
  end

  def is_admin?
    signed_in? ? current_user.admin : false
  end

  def correct_user
    @user = User.find(session[:user_id]) if session[:user_id]

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



end
