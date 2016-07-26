require 'rails_helper'
require 'spec_helper'


RSpec.describe "adding a contact", type: :feature do
     before :each do
     	@before_count = Contact.count
	    @user = FactoryGirl.build(:user)
	    @contact = FactoryGirl.build(:contact)

	     visit new_user_registration_path
		 fill_in 'Email', with: @user.email
		 fill_in 'Phone number', with: @user.phone_number
		 fill_in 'Password', with: @user.password
		 fill_in 'Password confirmation', with: @user.password
		 click_button "Sign up"
		    #binding.pry

		 click_button "New Contact"

		    #hardcoding above to simulate user sign up. Will refactor later.
		 fill_in 'name', with: @contact.name
		 fill_in 'email', with: @contact.email
		 fill_in 'information', with: @contact.information
		 click_button "Create Contact"
	 end

	    
	   # it "registers user and adds a contact" do
		#    visit new_user_registration_path
		 #   fill_in 'Email', with: @user.email
		  #  fill_in 'Phone number', with: @user.phone_number
		   # fill_in 'Password', with: @user.password
		    #fill_in 'Password confirmation', with: @user.password
		    #click_button "Sign up"
		    #binding.pry

		    #click_button "New Contact"

		    #hardcoding above to simulate user sign up. Will refactor later.
		    #fill_in 'name', with: @contact.name
		    #fill_in 'email', with: @contact.email
		    #fill_in 'information', with: @contact.information
		#end
	
	  it "added a contact in the rails database" do
		  expect(Contact.count).not_to eq(@before_count)
	  end
	  it "shows flash notice upon successfullly adding contact" do 
	  	expect(page).to have_content("Contact was successfully created.")
	  	expect(page.status_code).to eq(200)
	  end
	  
    it "routes to Contact List page" do
    	expect(page).to have_content (@contact.name)
    end
end
