class Business::RcustomersController < ApplicationController
  def index
    @rcustomers = Rcustomer.all
  end
    
  def new
    @rcustomer = Rcustomer.new
  end

  def create
    @rcustomer = Rcustomer.create(rcustomer_params)
    if @rcustomer.valid?
      flash[:errors] = "Successfuly Performed create!"
      redirect_to business_rcustomers_path
    else 
      flash[:errors] = @rcustomer.errors.full_messages
      redirect_to new_business_rcustomers_path
    end
  end
    
  def preview
    @rcustomer = Rcustomer.find(params[:id])
  end
    
  def edit
    @rcustomer = Rcustomer.find(params[:id])
  end
    
  def update
    @rcustomer = Rcustomer.find(params[:id])
    if @rcustomer.update(rcustomer_params)
      flash[:errors] = "Successfuly Performed Update!"
      
      redirect_to preview_business_rcustomer_path(@rcustomer)
    else
      flash[:errors] = @rcustomer.errors.full_messages
      redirect_to edit_business_rcustomer_path(@rcustomer)
    end
  end

  def search
    if params[:search].blank?
      flash[:errors] = "Enter Valid Data!"
      redirect_to business_rcustomers_path
    else
      @parameter = params[:search.downcase]
      @rcustomers = Rcustomer.all.where("lower(name) LIKE :search", search: "%#{@parameter}%") 
    end
  end

  def delete_customer
    @rcustomer = Rcustomer.find(params[:id])
    if @rcustomer.destroy
      flash[:errors] = "Successfuly Performed delete!"
      redirect_to business_rcustomers_path
    else  
      flash[:errors] = @product.errors.full_messages
      redirect_to new_business_rcustomers_path
    end 
  end

  private
  def rcustomer_params
    params.require(:rcustomer).permit(:name, :email, :phone)
  end

end
