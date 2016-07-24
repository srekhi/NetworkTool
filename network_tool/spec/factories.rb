FactoryGirl.define  do
	factory :user do
		sequence :email do |n|
    		"rspectest#{n}@rspectest.com"
  		end		
		password "foobar"
		phone_number "1111111111"
	end	

	factory :contact do 
		sequence :email do |n|
    		"rspec_contact_test#{n}@contact_rspec.com"
  		end	
  		name "TestContactName"
		information "testinfo"
	end
end
	
