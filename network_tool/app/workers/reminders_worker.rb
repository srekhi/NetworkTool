require 'sidekiq'
require 'celluloid/current'

class RemindersWorker
	include Sidekiq::Worker
  	include Sidetiq::Schedulable

	 def perform(reminder_id, number, recurring)
	 	reminder = Reminder.find(reminder_id)
	 	for c in Contact.all 
	 		if reminder.contact_id == c.id 
	 		  contact = c
	 		end
	 	end
	 	if recurring.start_with('Not') #hardcoding this now will come back and improve.
	 	elsif recurring == '1 month'
	 		recurrence {monthly}
	 		#recurrence do 
	 			#going to run DateTime.current in order to tell 
	 			#monthly(1).
	 		#end
	 	elsif recurring == '3 months'
	 		recurrence {monthly(3)}
	 	elsif recurring == '6 months'
	 		recurrence {monthly(6)}
	 	elsif recurring == '1 year'
	 		recurrence {monthly(12)}
	 	end
	  	client = Twilio::REST::Client.new Rails.application.secrets.twilio_account_sid, Rails.application.secrets.twilio_auth_token
	  	message = client.messages.create from: '8326482121', to: number, body: "Hi, This is a reminder to text #{contact.name} regarding their #{reminder.occasion} today!"
  	end
   
#THE BELOW IS HOW YOU CALL THIS METHOD
    #RemindersWorker.perform_async
    # https://www.youtube.com/watch?v=iIXLt24f8Mg
end