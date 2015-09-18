require 'rails_helper'

RSpec.describe BookingsController, type: :controller do
  
  before do 
    Booking.delete_all
    Table.create(:name => "Sharath Kamal")
  end
  
  before :each do
    sign_out :user
  end

  it "all users can  access index without authentication" do
      get :index 
      expect(response).to have_http_status(200)
      expect(response).to be_success
      expect(response).to render_template("index")
  end
  
   it "creates a new Booking when created with valid data" do
      Booking.delete_all
      @user = FactoryGirl.create(:valid_user)
      sign_in @user  
      json = { :format => 'json',  booking: FactoryGirl.attributes_for(:user_input_booking)}
      expect{post :create, json}.to change(Booking,:count).by(1)
   end
   
   it "does not a new Booking with invalid data" do
      Booking.delete_all
      @user = FactoryGirl.create(:valid_user)
      sign_in @user  
      booking = FactoryGirl.create(:user_input_booking_attributes)
      json = { :format => 'json',  booking: FactoryGirl.attributes_for(:user_input_booking)}
      expect{post :create, json}.to change(Booking,:count).by(0)
   end
  
end
