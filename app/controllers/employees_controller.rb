class EmployeesController < ApplicationController
  def index
    @employees = Employee.all
    self.searchEmail
  end

  def searchEmail
    if params[:search_query]
      if Employee.find_by("email = ?",params[:search_query])
        flash[:notice]="Entered Email is already present"
      else
        flash[:notice]="Entered Email is not already present"
      end
    end
  end
  
  def increaseOrder
    @temp = Employee.find_in_batches(batch_size:10)
      @temp.first.each do |e|
        e.no_of_order += 1
        e.save
      end
      redirect_to employees_path(@employee)
  end
    
  def decreaseOrder
    @temp = Employee.find_in_batches(batch_size:10)
      @temp.first.each do |e|
        e.no_of_order -= 1
        e.save
      end
      redirect_to employees_path(@employee)
  end
  
  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.create(employee_params)
    if @employee.valid?
      flash[:errors] = "Successfully Created Employee"
      redirect_to employees_path
    else  
      flash[:errors] = @employee.errors.full_messages
      redirect_to new_employee_path
    end
  end

  def show
    @employee = Employee.find(params[:id])
  end

  def edit
    @employee = Employee.find(params[:id])
  end

  def update
    @employee = Employee.find(params[:id])
    if @employee.update(employee_params)
      flash[:errors] = "Successfully Updated Employee"
      redirect_to employee_path(@employee)
    else  
      flash[:errors] = @employee.errors.full_messages
      redirect_to edit_employee_path
    end
  end

  def destroy
    @employee = Employee.find(params[:id])
    if @employee.destroy
      flash[:errors] = "Successfully Deleted Employee"
      redirect_to employees_path
    else  
      flash[:errors] = @employee.errors.full_messages
      redirect_to new_employee_path
    end
  end

  def employee_params
    params.require(:employee).permit(:firstname, :lastname, :email, :age,:no_of_order,:full_time_available,:salary)
  end

  def queries

  end
end
