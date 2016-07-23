require 'rails_helper'

RSpec.describe "user registration", type: :feature do
      
      before :all do
      	user = Factory(:user)
	    visit new_user_registration_path
	    fill_in 'email', with: user.email
	    fill_in 'phone_number', with: user.phone_number
	    fill_in 'password', with: user.password
	    fill_in 'password_confirmation', with: user.password
	    click_button "Sign Up"
	end

	  it "shows flash notice upon successful sign up" do
	  	expect(page).to have_content("Welcome! You have signed up successfully.")
	  	expect(response).to have_http_status(200)
	  end

	  it "shows up properly in Rails database" do
	  user_compare = User.find(user.id) #searches for database's user and compares against the inputted user details
	  expect(user_compare).to eq(user) #if this is true, all user details saved properly
    end
    it "reroutes to Contact List page" do
    	expect(page).to have_content ("Contact List:")
    end
end
