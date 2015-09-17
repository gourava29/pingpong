require 'rails_helper'

RSpec.describe Booking, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
    it  " should not create booking without 60 minutes gap" do
      curr_booking = FactoryGirl.build(:booking1)
      expect(curr_booking).to be_valid
    end
end
