class ActionMailerUsersController < ApplicationController
  def index
    @amusers = ActionMailerUser.all
  end

  def new
    @amuser = ActionMailerUser.new
  end

  def create
    @amuser = ActionMailerUser.create(amuser_params)
    if @amuser.valid?
      UserMailer.with(amuser: @amuser).welcome_email.deliver
      flash[:errors] = "Successfully Created User"
      redirect_to action_mailer_users_path
    else
    flash.now[:errors] = @amuser.errors.full_messages
    render :new
    end
  end

  def show
    @amuser = ActionMailerUser.find(params[:id])
  end

  def edit
    @amuser = ActionMailerUser.find(params[:id])
  end

  def update
    @amuser = ActionMailerUser.find(params[:id])
    before_mail = @amuser.email
    if @amuser.update(amuser_params)
      UserMailer.with(amuser: @amuser).update_email.deliver if before_mail != @amuser.email
      flash[:errors] = "Successfully  Updated User"
      redirect_to action_mailer_user_path(@amuser)
    else
      flash.now[:errors] = @amuser.errors.full_messages
      render :edit
    end
  end

  def destroy
    @amuser = ActionMailerUser.find(params[:id])
    if @amuser.destroy
      flash[:errors] = "Successfully Deleted User"
      redirect_to action_mailer_users_path
    else
      flash.now[:errors] = @amuser.errors.full_messages
      render :new
    end
  end

  def amuser_params
    params.require(:action_mailer_user).permit(:name,:email,:picture)
  end
end
