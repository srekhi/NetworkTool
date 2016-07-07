class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  protect_from_forgery with: :exception

  #current_user should be made available by devise to ApplicationController. Anything that inherits from it should also have current_user.
  



  def welcome
  end
  
end
