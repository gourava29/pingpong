require 'rails_helper'

RSpec.describe Booking, type: :model do
  
  before :each do 
    Booking.delete_all
  end
  pending "add some examples to (or delete) #{__FILE__}"
   it  "should create booking when valida parameters are given" do
      curr_booking = FactoryGirl.build(:booking1)
      expect(curr_booking).to be_valid
    end
    
    it  " should not create booking without 60 minutes gap" do
      curr_booking = FactoryGirl.create(:booking1)
      new_booking = FactoryGirl.build(:booking2)
      expect(new_booking).not_to be_valid
    end
    
    it "should not create booking with duration exceeding 60 mins" do 
      curr_booking = FactoryGirl.build(:booking3)
      expect(curr_booking).not_to be_valid
    end
    
    it "should create booking with duration not exceeding 60 mins" do 
      curr_booking = FactoryGirl.build(:booking4)
      expect(curr_booking).to be_valid
    end
    
    it "checking the table_exist validation for overlap bookings " do 
      curr_booking = FactoryGirl.create(:booking5)
      new_booking = FactoryGirl.build(:booking6)
      expect(new_booking).not_to be_valid
    end
end
