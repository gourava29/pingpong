class BookingsController < ApplicationController
    
    def index
        @tables = Table.all()
        @bookings = Booking.all()
    end
    
    def getAll
       @bookings = Booking.all();
       @response = []
       puts @response
       @bookings.each do |booking|
           @response.push({:start_time => booking[:start_time].to_i,
           :end_time => booking[:start_time].to_i,
           :user_id => booking[:user_id],
           :id => booking[:id],
           :table_id => booking[:table_id]})
       end
       puts @response.inspect
       render json: @response 
       
    end
    
    def create 
        @resp = booking_params
        if current_user
            @booking = Booking.new(booking_params)
            @booking.user_id = current_user[:id]
            @booking.start_time = Time.at(booking_params[:start_time].to_i)
            @booking.end_time = Time.at(booking_params[:end_time].to_i)
            if @booking.save
                @resp[:success] = true;
            else
                @resp[:message] = @booking.errors[:table][0]
                @resp[:success] = false;
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
