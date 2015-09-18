require 'rails_helper'
require 'spec_helper'

describe "Bookings" do
  it "should be able to visit Bookings Index Page without login" do
    visit "/bookings"
    expect(page).to have_content 'Create New Booking'
    expect(page).to have_selector('table tr')
  end
  
  it "should not allow user to create booking without logging in" do
      visit "/bookings"
      find('.date').set('9/17/2015')
      find('.time.start').set('12:20am')
      find('.time.end').set('12:40am')
      click_button "submit"
     
      expect(page).to have_content 'user not logged in'
  end
end