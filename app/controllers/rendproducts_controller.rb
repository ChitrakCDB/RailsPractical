class RendproductsController < ApplicationController
  before_action :authenticate_user
  def index
  @rendproducts = Rendproduct.all
  end
  
  def new
  @rendproduct = Rendproduct.new
  end
  
  
  def create
  @rendproduct = Rendproduct.create(rendproduct_params)
  if @rendproduct.valid?
    flash[:notice] = "Successfuly Performed create!"
    redirect_to rendproducts_path
  else 
    flash[:errors] = @rendproduct.errors.full_messages
    render :new
  end
  end
  
  def show
  @rendproduct = Rendproduct.find(params[:id])
  end
  
  def edit
  @rendproduct = Rendproduct.find(params[:id])
  end
  
  def update
  @rendproduct = Rendproduct.find(params[:id])
  if @rendproduct.update(rendproduct_params)
    flash[:notice] = "Successfuly Performed Update!"
    
    redirect_to rendproduct_path(@rendproduct)
  else
    flash[:errors] = @rendproduct.errors.full_messages
    render :edit
  end
  end
  
  def destroy
  @rendproduct = Rendproduct.find(params[:id])
  if @rendproduct.destroy
    flash[:notice] = "Successfuly Performed delete!"
    redirect_to rendproducts_path
  else  
    flash[:errors] = @product.errors.full_messages
    render :new
  end 
  end 
  
  def authenticate_user
    if !current_renduser
      flash[:notice]="Please login or sign up!"
      redirect_to new_renduser_session_path
    end
  end

  private
  def rendproduct_params
  params.require(:rendproduct).permit(:name, :price, :description, :renduser_id)
  end
end
