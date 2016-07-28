class WelcomeController < ApplicationController
  def index
  	if user_signed_in?
      redirect_to contacts_path
    end
  end

  def displayhome #show the proper home page even when use is signed in (bad code I know--will refactor later.)
  end
end
