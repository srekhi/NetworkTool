FactoryGirl.define  do
	factory :user do
		sequence :email do |n|
    		"rspec_test#{n}@rspec_test.com"
  		end		
		password "foobar"
		phone_number "1111111111"
	end	
end
	
