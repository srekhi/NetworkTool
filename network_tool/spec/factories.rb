FactoryGirl.define  do
	factory :user do
		sequence(:email) { |n| "foo#{n}@example.com"}
		password "foobar"
		phone_number "1111111111"
	end

	
end
	
