class ApplicationController < ActionController::Base
    #before_action :authorized
    helper_method :current_myuser
    helper_method :logged_in?
    def current_myuser
        Myuser.find_by(id: session[:myuser_id])
    end

    def logged_in?
        !current_myuser.nil?
    end

    # def authorized
    #     redirect_to welcome_path unless logged_in?
    # end
end
