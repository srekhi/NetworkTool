require 'sidekiq'
require 'celluloid/current'


class RemindersWorker
	include Sidekiq::Worker
	include Sidekiq::Worker

	 def perform(reminder_id, number, recurring)
	 	reminder = Reminder.find(reminder_id)
	 	for c in Contact.all 
	 		if reminder.contact_id == c.id 
	 		  contact = c
	 		end
	 	end
	 	if recurring.start_with('Not') #hardcoding this now will come back and improve.
	 		break
	 	else if recurring == '1 month'
	 		recurrence {monthly}
	 		#recurrence do 
	 			#going to run DateTime.current in order to tell 
	 			#monthly(1).
	 			
	 		#end
	 	else if recurring == '3 months'
	 		recurrence {monthly(3)}
	 	else if recurring == '6 months'
	 		recurrence {monthly{6}}
	 	else if recurrin == '1 year'
	 		recurrence {yearly}
	 	end
	 	
	  	client = Twilio::REST::Client.new Rails.application.secrets.twilio_account_sid, Rails.application.secrets.twilio_auth_token
	  	message = client.messages.create from: '8326482121', to: number, body: "Hi, This is a reminder to text #{contact.name} regarding their #{reminder.occasion} today!"
  	end
   
#THE BELOW IS HOW YOU CALL THIS METHOD
    #RemindersWorker.perform_async
    # https://www.youtube.com/watch?v=iIXLt24f8Mg
  
end