class Booking < ActiveRecord::Base
    belongs_to :table
    belongs_to :user
    
    validate :time_validator
    
    def time_validator
        if self.end_time - self.start_time > 1.hour
            errors.add :table, "Booking can be made for a maximum of 1 hour."
        elsif (Booking.where("user_id = ? AND (start_time < ? and end_time > ?)", self.user_id, self.end_time + 1.hour, self.start_time-1.hour).count > 0)
          errors.add :table, "not available in the given time interval due to overlap with other Booking."
        end
    end
end
