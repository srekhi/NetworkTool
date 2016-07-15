require 'sidekiq'

class RemindersWorker
	include Sidekiq::Worker
	include Sidekiq::Worker

	 def perform(reminder_id, number)
	 	reminder = Reminder.find(reminder_id)
	 	for c in Contact.all 
	 		if reminder.contact_id == c.id 
	 		  contact = c
	 		end
	 	end
	  	client = Twilio::REST::Client.new Rails.application.secrets.twilio_account_sid, Rails.application.secrets.twilio_auth_token
	  	message = client.messages.create from: '8326482121', to: number, body: "Hi, This is a reminder to text #{contact.name} regarding their #{reminder.occasion} today!"
  	end
   
#THE BELOW IS HOW YOU CALL THIS METHOD
    #RemindersWorker.perform_async
    # https://www.youtube.com/watch?v=iIXLt24f8Mg
  
end