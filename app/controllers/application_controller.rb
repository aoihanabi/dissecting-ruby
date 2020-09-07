class ApplicationController < ActionController::Base

  before_filter :configure_permitted_parameters, if: :devise_controller?
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name]) #new user
    devise_parameter_sanitizer.permit(:account_update, keys: [:name]) #edit user
  end
end
