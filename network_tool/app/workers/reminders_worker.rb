class RemindersWorker

 def perform(reminder, number)
  	client = Twilio::REST::Client.new Rails.application.secrets.twilio_account_sid, Rails.application.secrets.twilio_auth_token
  	message = client.messages.create from: '8326482121', to: 'number', body: 'Hi, This is a reminder to text @reminder.contact regarding @reminder.occasion.'
  	
    ##Do something later
  end
   
#THE BELOW IS HOW YOU CALL THIS METHOD
    #RemindersWorker.perform_async
    # https://www.youtube.com/watch?v=iIXLt24f8Mg
  
end