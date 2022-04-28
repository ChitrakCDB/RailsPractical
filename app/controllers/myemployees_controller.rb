class MyemployeesController < ApplicationController
  def index
    @myemployees = Myemployee.all
  end

  def new
    @myemployee = Myemployee.new
    1.times{@myemployee.myaddresses.build}
  end

  def create
    @myemployee = Myemployee.create(myemployee_params)
    if @myemployee.valid?
      flash[:errors] = "Successfully Created Employee"
      redirect_to myemployees_path
    else
    flash.now[:errors] = @myemployee.errors.full_messages
    render :new
    end
  end

  def show
    @myemployee = Myemployee.find(params[:id])
  end

  def edit
    @myemployee = Myemployee.find(params[:id])
  end

  def search
    if params[:search].blank?
      flash[:errors] = "Enter Valid Data!"
      redirect_to myemployees_path
    else
      @parameter = params[:search.downcase]
      @myemployee = Myemployee.all.where("lower(email) LIKE :search", search: "%#{@parameter}%") 
    end
  end

  def update
    @myemployee = Myemployee.find(params[:id])
    if @myemployee.update(myemployee_params)
      flash[:errors] = "Successfully  Updated Employee"
      redirect_to myemployee_path(@myemployee)
    else
      flash.now[:errors] = @myemployee.errors.full_messages
      render :edit
    end
  end

  def destroy
    @myemployee = Myemployee.find(params[:id])
    if @myemployee.destroy
      flash[:errors] = "Successfully Deleted Employee"
      redirect_to myemployees_path
    else
      flash.now[:errors] = @myemployee.errors.full_messages
      render :new
    end
  end

  def myemployee_params
    params.require(:myemployee).permit(:employee_name,:email,:password,:gender,{hobbies:[]},:address,:mobile_number,:birth_date,:document,myaddresses_attributes: [:house_name, :street_name, :road])
  end
end
