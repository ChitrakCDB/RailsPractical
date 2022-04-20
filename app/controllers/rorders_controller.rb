class RordersController < ApplicationController

  def index
    @rproduct = Rproduct.find(params[:rproduct_id])
  end
    
  def new
    @rproduct = Rproduct.find(params[:rproduct_id])
    @rorder = Rorder.new
  end
    
    
  def create
    @rproduct = Rproduct.find(params[:rproduct_id])
    @rorder = @rproduct.rorders.create(rorder_params)
    if @rorder.valid?
      flash[:notice] = "Successfuly Performed create!"
      redirect_to rproduct_path(@rproduct)
    else 
      flash[:errors] = @rorder.errors.full_messages
      redirect_to new_rproduct_rorder_path
    end
  end
    
  def show
    @rorder = Rorder.find(params[:id])
    @rproduct = Rproduct.find(params[:rproduct_id])

  end
    
  def edit
    @rproduct = Rproduct.find(params[:rproduct_id])
    @rorder = Rorder.find(params[:id])
  end
    
  def update
    @rproduct = Rproduct.find(params[:rproduct_id])
    @rorder = @rproduct.rorders.find(params[:id])
    if @rorder.update(rorder_params)
      flash[:notice] = "Successfuly Performed Update!"
      
      redirect_to rproduct_path(@rproduct)
    else
      flash[:errors] = @rorder.errors.full_messages
      redirect_to edit_rproduct_rorder_path(@roder)
    end
  end
    
  def destroy
    @rproduct = Rproduct.find(params[:rproduct_id])
    @rorder = Rorder.find(params[:id])
    if @rorder.destroy
      flash[:notice] = "Successfuly Performed delete!"
      redirect_to rproduct_path(@rproduct)
    else  
      flash[:errors] = @product.errors.full_messages
      redirect_to new_rproduct_rorder_path
    end 
  end 

  private
  def rorder_params
    params.require(:rorder).permit(:quantity)
  end
end
