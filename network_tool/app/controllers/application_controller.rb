class ApplicationController < ActionController::Base
	before_action :configure_devise_permitted_parameters, if: :devise_controller?

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  protect_from_forgery with: :exception

  #current_user should be made available by devise to ApplicationController. Anything that inherits from it should also have current_user.


  protected

  def configure_devise_permitted_parameters
    registration_params = [:email, :password, :password_confirmation, :phone_number]

    if params[:action] == 'update'
      devise_parameter_sanitizer.for(:account_update) { 
        |u| u.permit(registration_params << :current_password)
      }
    elsif params[:action] == 'create'
      devise_parameter_sanitizer.for(:sign_up) { 
        |u| u.permit(registration_params) 
      }
    end
  end

  def welcome
  end



end
