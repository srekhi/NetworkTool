require 'rails_helper'

RSpec.describe "Send Text Reminders", type: :request do
 # describe "GET /send_texts" do
    it "sends user text reminder when reminder next_run is triggered" do
      user = Factory(:user)

      get send_texts_path
      expect(response).to have_http_status(200)
    end
  end
  
end
