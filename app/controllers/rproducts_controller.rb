class RproductsController < ApplicationController

  def index
    @rproducts = Rproduct.all
  end
    
  def new
    @rproduct = Rproduct.new
  end
    
    
  def create
    @rproduct = Rproduct.create(rproduct_params)
    if @rproduct.valid?
      flash[:notice] = "Successfuly Performed create!"
      redirect_to rproducts_path
    else 
      flash[:errors] = @rproduct.errors.full_messages
      redirect_to new_rproduct_path
    end
  end
    
  def show
    @rproduct = Rproduct.find(params[:id])
  end
    
  def edit
    @rproduct = Rproduct.find(params[:id])
  end
    
  def update
    @rproduct = Rproduct.find(params[:id])
    if @rproduct.update(rproduct_params)
      flash[:notice] = "Successfuly Performed Update!"
      
      redirect_to rproduct_path(@rproduct)
    else
      flash[:errors] = @rproduct.errors.full_messages
      redirect_to edit_rproduct_path(@rproduct)
    end
  end
    
  def destroy
    @rproduct = Rproduct.find(params[:id])
    if @rproduct.destroy
      flash[:notice] = "Successfuly Performed delete!"
      redirect_to rproducts_path
    else  
      flash[:errors] = @product.errors.full_messages
      redirect_to new_rproduct_path
    end 
  end 

  private
  def rproduct_params
    params.require(:rproduct).permit(:name, :price, :description)
  end

end
   

