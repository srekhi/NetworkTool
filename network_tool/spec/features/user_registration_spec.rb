require 'rails_helper'
require 'spec_helper'


RSpec.describe "user registration", type: :feature do
     before :each do
     	@before_count = User.count
	    @user = FactoryGirl.build(:user)
	    visit new_user_registration_path
	    fill_in 'Email', with: @user.email
	    fill_in 'Phone number', with: @user.phone_number
	    fill_in 'Password', with: @user.password
	    fill_in 'Password confirmation', with: @user.password
	    click_button "Sign up"
	end
	  it "added a record in the rails database" do
		  #user_compare = User.find(@user.id) #searches for database's user and compares against the inputted user details
		 # expect(user_compare).to eq(@user) #if this is true, all user details saved properly
		  expect(User.count).not_to eq(@before_count)
	  end
	  it "shows flash notice upon successful sign up" do #this is one example
	  	expect(page).to have_content("Welcome! You have signed up successfully.")
	  	expect(page.status_code).to eq(200)
	  end
	  
    it "routes to Contact List page" do
    	expect(page).to have_content ("Contact List:")
    end
end
