namespace :reminders_notifications do

	desc 'send reminder text' #this is description
	task :send_reminder_text => :environment do  # I guess scanning local database right now... wont be hard to scan another db im guessing.

		for r in Reminder.all
			if r.next_run == Date.today
				contact = findCorrespondingContact(r)	
				user = findCorrespondingUser(contact)
				sendText(user, contact, r)
				r.next_run = r.next_run + eval("#{r.interval}.month") #LOOK INTO EVAL FOR SECURITY ISSUES
				r.save				
			end
		end
	end

		def findCorrespondingContact(reminder)
			for c in Contact.all  #this is how you find the corresponding contact for the reminder.
		 		if reminder.contact_id == c.id 
		 		  	return c
		 		end
		 	end
		 end

		def findCorrespondingUser(contact)
			for u in User.all  #this is how you find the corresponding contact for the reminder.
		 		if contact.user_id == u.id #for some reason, contact is an array.
					return u
		 		end
		 	end
		end

		def sendText(user, contact, r)
			client = Twilio::REST::Client.new Rails.application.secrets.twilio_account_sid, Rails.application.secrets.twilio_auth_token
		  	message = client.messages.create from: '8326482121', to: user.phone_number, body: "Hi, This is a reminder to text #{contact.name} regarding #{r.occasion} today!"
		end
end

