class MyusersController < ApplicationController
  
  skip_before_action  only: [:new, :create]

  def new
    @myuser = Myuser.new 
    @myuser.build_address
  end

  def show
    @myuser = Myuser.find(session[:myuser_id])
    if session[:myuser_id] && params[:event_id]
      EnrolledUser.create(myuser_id:session[:myuser_id],event_id:params[:event_id])
      flash[:errors] = "Successfully Enrolled in Event"
      redirect_to myuser_path(current_myuser.id)
    end
  end

  def create
    @myuser = Myuser.create(params.require(:myuser).permit(:username,:password,address_attributes: [:myuser_address]))
    session[:myuser_id] = @myuser.id 
    flash[:errors] = "Successfully SignedUp"
    redirect_to events_path
  end

  def unenroll
    EnrolledUser.delete_by("myuser_id=? and event_id=?",current_myuser.id,params[:event_id])
    flash[:errors] = "Successfully Unenrolled in Event"   
    redirect_to events_path                                                 
  end

end
