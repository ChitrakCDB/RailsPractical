class ApplicationController < ActionController::Base
    helper_method :current_myuser
    helper_method :logged_in?
    def current_myuser
        Myuser.find_by(id: session[:myuser_id])
    end

    def logged_in?
        !current_myuser.nil?
    end

end
