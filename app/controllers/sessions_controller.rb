class SessionsController < ApplicationController

  skip_before_action  only: [:new, :create, :welcome]
  def new

  end

  def login

  end
  
  def create
    @myuser = Myuser.find_by(username: params[:username])
    if @myuser && @myuser.authenticate(params[:password])
      session[:myuser_id] = @myuser.id
      flash[:errors] = "Successfully Logged in"
      redirect_to events_path
    else   
      flash[:errors] = "Create Account First"
      redirect_to login_path
    end
  end

  def destroy
    session[:myuser_id] = nil
    redirect_to events_path
  end

  def page_requires_login

  end
end
