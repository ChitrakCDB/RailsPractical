class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :current_myuser
  helper_method :logged_in?
   
  def current_myuser
    Myuser.find_by(id: session[:myuser_id])
  end

  def logged_in?
    !current_myuser.nil?
  end

  # def after_sign_in_path_for(resource)
  #   puts "==============================================================================="
  #   events_path # your path
  # end
  def after_sign_out_path_for(resource)
    renduser_session_path
  end

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:role])
      devise_parameter_sanitizer.permit(:account_update, keys: [:role])
    end

end
