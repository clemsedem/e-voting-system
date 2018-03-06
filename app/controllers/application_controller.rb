class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  
  before_action :authenticate_user!
  before_filter :set_cache_headers
  protect_from_forgery with: :exception
  
  before_filter :configure_permitted_parameters, if: :devise_controller?
  
  
  
  
  
  
   protected
   
   def set_cache_headers
      response.headers["Cache-Control"] = "no-cache, no-store"
      response.headers["Pragma"] = "no-cache"
      # response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
    end
  
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :surname, :other_names, :email, :password, :password_confirmation, :user_type_id,:creator_id, :remember_me]) 
      devise_parameter_sanitizer.permit(:sign_in, keys: [:username, :login, :password, :role_id,:creator_id,:remember_me])
      devise_parameter_sanitizer.permit(:account_update, keys: [:username, :email, :password, :password_confirmation, :current_password,:user_type_id,:entity_master_id,:creator_id])
   end
  
end
