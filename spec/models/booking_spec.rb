require 'rails_helper'

RSpec.describe Booking, type: :model do
  before do 
    FactoryGirl.create(:valid_user)
    FactoryGirl.create(:valid_user)
  end
  
  before :each do 
    Booking.delete_all
  end
  
    it "should create booking when valid parameters are given" do
      curr_booking = FactoryGirl.build(:booking1)
      expect(curr_booking).to be_valid
    end
    
    it "should not create booking when table is booked for selected time gap" do 
      curr_booking = FactoryGirl.create(:time_gap_booking1)
      new_booking = FactoryGirl.build(:time_gap_booking2)
      expect(new_booking).not_to be_valid
    end
    
    
    it "can be made for a maximum of 1 hour." do 
      curr_booking = FactoryGirl.build(:less_than_one_hour)
      expect(curr_booking).to be_valid
    end
    
    it "cannot be made for time exceeding 1 hour" do 
      curr_booking = FactoryGirl.build(:more_than_one_hour)
      expect(curr_booking).not_to be_valid
    end
    
    it "should not create booking when table is booked by the same User for selected time gap" do 
      curr_booking = FactoryGirl.create(:time_gap_same_user_booking1)
      new_booking = FactoryGirl.build(:time_gap_same_user_booking2)
      expect(new_booking).not_to be_valid
    end
    
end
