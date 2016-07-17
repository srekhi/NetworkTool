desc 'send reminder text' #this is description
task send_reminder_text: :environment do 

	reminderList = Reminder.all
	for r in reminderList
		if r.next_run == DateTime.now.day
			contact = findCorrespondingContact(r)
			user = findCorrespodingUser(contact)
			sendText(user, contact)
			r.next_run = r.next_run + interval

			
		end
	end

	def findCorrespondingContact(r)
		for c in Contact.all  #this is how you find the corresponding contact for the reminder.
	 		if reminder.contact_id == c.id 
	 		  contact = c
	 		end
	 	end
	 end

	def findCorrespondingUser(contact)
		for u in User.all  #this is how you find the corresponding contact for the reminder.
	 		if contact.user_id == u.id 
	 		  user = u
	 		end
	 	end
	end

	def sendText(user, contact)
		client = Twilio::REST::Client.new Rails.application.secrets.twilio_account_sid, Rails.application.secrets.twilio_auth_token
	  	message = client.messages.create from: '8326482121', to: user.number, body: "Hi, This is a reminder to text #{contact.name} regarding their #{reminder.occasion} today!"
	end

end