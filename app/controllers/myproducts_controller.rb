class MyproductsController < ApplicationController
  def index
    @myproducts=Myproduct.unscoped
  end

  def new
    @myproduct= Myproduct.new
  end

  def create
    @myproduct= Myproduct.create(myproduct_params)
    if @myproduct.valid?
      flash[:notice]="Successfuly Performed create!"
      redirect_to myproducts_path
    else 
      flash[:errors]=@myproduct.errors.full_messages
      redirect_to new_myproduct_path
    end

  end

  def show
    @myproduct = Myproduct.unscoped.find(params[:id])
  end

  def edit
    @myproduct = Myproduct.unscoped.find(params[:id])
  end

  def update
    @myproduct = Myproduct.unscoped.find(params[:id])
    if @myproduct.update(myproduct_params)
      flash[:notice]="Successfuly Performed Update!"
      
      redirect_to myproduct_path(@myproduct)
    else
      flash[:errors]=@myproduct.errors.full_messages
      redirect_to edit_myproduct_path(@myproduct)
    end
  end

  def destroy

    @myproduct = Myproduct.unscoped.find(params[:id])
    if @myproduct.destroy
      flash[:notice]="Successfuly Performed delete!"
      redirect_to myproducts_path
    else  
      flash[:errors]=@myproduct.errors.full_messages
      redirect_to new_myproduct_path
    end
    
  end

  def defaultscopeview
    @myproductscope = Myproduct.all
  end

  private
  def myproduct_params
    params.require(:myproduct).permit(:name, :price, :brand, :title, :description, :capacity, :status, :is_active)
  end

end
