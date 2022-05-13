class RegisterusersController < ApplicationController
  def index
    @registerusers = Registeruser.all
  end

  def new
    @registeruser = Registeruser.new
  end

  def create
    @registeruser = Registeruser.create(resgisterusers_params)
    if @registeruser.valid?
      flash[:notice] = "Successfully Performed Create!"
      redirect_to registerusers_path
    else
      flash[:errors] = @registeruser.errors.full_messages
      redirect_to new_registeruser_path
    end
  end

  def show
    @registeruser = Registeruser.find(params[:id])
  end

  def edit
    @registeruser = Registeruser.find(params[:id])
  end

  def update
    @registeruser = Registeruser.find(params[:id])
    @registeruser_data = Registeruser.find_by_id(@registeruser)
    @registeruser.update(resgisterusers_params)
    if @registeruser.valid?
      respond_to do |format|
        flash[:errors] = "Successfully Performed Update!"
        format.js
      end
    else   
      respond_to do |format|
        flash[:errors] = @registeruser.errors.full_messages
        format.js
      end
    end
  end

  def destroy
    @registeruser = Registeruser.find(params[:id])
    if @registeruser.destroy
      flash[:notice] = "Successfully Performed Delete!"
      redirect_to registerusers_path
    else
      flash[:errors] = @registeruser.errors.full_messages
      redirect_to new_registeruser_path
    end
  end

  def changepassword
    @registeruser = Registeruser.find(params[:id])
  end

  def updatepassword
    @registeruser = Registeruser.find(params[:id])
    if @registeruser.update_attribute(:password,params[:registeruser][:password])
      flash[:notice] = 'Password was changed successfully.'
      redirect_to registeruser_path(@registeruser)
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to updatepassword_registeruser_path(@registeruser)
    end
  end

  private
  def resgisterusers_params
    params.require(:registeruser).permit(:first_name,:last_name,:email,:password,:subscription,:subscription_email)
  end
end
