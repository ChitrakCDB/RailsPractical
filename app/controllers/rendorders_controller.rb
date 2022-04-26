class RendordersController < ApplicationController

  def index
    @rendproduct = Rendproduct.find(params[:rendproduct_id])
  end
    
  def new
    @rendproduct = Rendproduct.find(params[:rendproduct_id])
    @rendorder = Rendorder.new
  end
    
    
  def create
    @rendproduct = Rendproduct.find(params[:rendproduct_id])
    @rendorder = @rendproduct.rendorders.create(rendorder_params)
    if @rendorder.valid?
      flash[:notice] = "Successfuly Performed create!"
      redirect_to rendproducts_path
    else 
      flash[:errors] = @rendorder.errors.full_messages
      render :new
    end
  end
    
  def show
    @rendorder = Rendorder.find(params[:id])
    @rendproduct = Rendproduct.find(params[:rendproduct_id])

  end
    
  def edit
    @rendproduct = Rendproduct.find(params[:rendproduct_id])
    @rendorder = Rendorder.find(params[:id])
  end
    
  def update
    @rendproduct = Rendproduct.find(params[:rendproduct_id])
    @rendorder = @rendproduct.rendorders.find(params[:id])
    if @rendorder.update(rendorder_params)
      flash[:notice] = "Successfuly Performed Update!"
      
      redirect_to rendproduct_path(@rendproduct)
    else
      flash[:errors] = @rendorder.errors.full_messages
      render :edit
    end
  end
    
  def destroy
    @rendproduct = Rendproduct.find(params[:rendproduct_id])
    @rendorder = Rendorder.find(params[:id])
    if @rendorder.destroy
      flash[:notice] = "Successfuly Performed delete!"
      redirect_to rendproduct_path(@rendproduct)
    else  
      flash[:errors] = @rendproduct.errors.full_messages
      render :new
    end 
  end 

  private
  def rendorder_params
    params.require(:rendorder).permit(:quantity)
  end
  
end
