class BookingsController < ApplicationController
    
    def index
        @tables = Table.all()
        @bookings = Booking.all()
    end
    def create 
        @resp = booking_params
        if current_user
            puts "8888888888888888888888"
            puts booking_params.inspect
            #puts DateTime.parse booking_params[:start_time].to_i
            puts "8888888888888888888888"
            @booking = Booking.new(booking_params)
            @booking.user_id = current_user[:id]
            @booking.start_time = Time.at(booking_params[:start_time].to_i).getutc
            @booking.end_time = Time.at(booking_params[:end_time].to_i).getutc
            puts @booking.inspect
            if @booking.save
                @resp[:success] = true;
            else
                @resp[:message] = @booking.errors[:table][0]
                @resp[:success] = true;
            end
        else
            @resp[:success] = false;
            @resp[:message] = "user not logged in"
        end
        
        respond_to do |format|
            format.json { render json: @resp }
        end
    end
    
    def booking_params
      params.require(:booking).permit(:table_id, :start_time, :end_time)
    end
end
