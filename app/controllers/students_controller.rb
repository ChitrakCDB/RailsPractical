class StudentsController < ApplicationController
  def index
    @students = Student.all
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.create(params.require(:student).permit(:firstname, :lastname, :DOB, :department, :terms_of_usage))
    if @student.valid?
      flash[:notice] = "Successfully Created Student"
      redirect_to students_path

    else
      flash[:errors] = @student.errors.full_messages
      redirect_to new_student_path
    end
  end

  def show
    @student = Student.find(params[:id])
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])
    if @student.update(params.require(:student).permit(:firstname, :lastname, :DOB, :department, :terms_of_usage))
      flash[:notice] = "Successfully Updated Student"
      redirect_to student_path(@student)
    
    else
      flash[:errors] = @student.errors.full_messages
      redirect_to edit_student_path
    end
  end

  def destroy
    @student = Student.find(params[:id])
    if @student.destroy
      flash[:notice] = "Successfully Deleted Student"
      redirect_to students_path

    else
      flash[:errors] = @student.errors.full_messages
      redirect_to new_book_path
    end
  end
end
