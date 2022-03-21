class FacultiesController < ApplicationController
  def index
    @faculties = Faculty.all
  end

  def new
    @faculty = Faculty.new
  end

  def create
    @faculty = Faculty.create(params.require(:faculty).permit(:firstname, :lastname, :phone_num, :email, :DOB, :designation))
    if @faculty.valid?
      flash[:notice] = "Successfully Created Faculty"
      redirect_to faculties_path
    else 
      flash[:errors] = @faculty.errors.full_messages
      redirect_to new_faculty_path
    end
  end

  def show
    @faculty = Faculty.find(params[:id])
  end

  def edit
    @faculty = Faculty.find(params[:id])
  end

  def update
    @faculty =Faculty.find(params[:id])
    if @faculty.update(params.require(:faculty).permit(:firstname, :lastname, :phone_num, :email, :DOB, :designation))
      flash[:notice] = "Successfully Created Faculty"
      redirect_to faculty_path(@faculty)
    
    else
      flash[:errors] = @faculty.errors.full_messages
      redirect_to edit_faculty_path
    end
  end

  def destroy
    @faculty = Faculty.find(params[:id])
    if @faculty.destroy
      flash[:notice] = "Successfully Deleted Faculty"
      redirect_to faculties_path
      
    else 
      flash[:errors] = @faculty.errors.full_messages
      redirect_to new_faculty_path
    end
  end
end
