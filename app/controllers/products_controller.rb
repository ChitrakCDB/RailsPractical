class ProductsController < ApplicationController
  def index
    @products=Product.all
  end

  def new
    @product= Product.new
  end

  def create
    @product= Product.create(params.require(:product).permit(:name, :price, :brand))
    if @product.valid?
      flash[:notice]="Successfuly Performed create!"
      redirect_to products_path
    else 
      flash[:errors]=@product.errors.full_messages
      redirect_to new_product_path
    end

  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(params.require(:product).permit(:name, :price, :brand))
      flash[:notice]="Successfuly Performed Update!"
      
      redirect_to product_path(@product)
    else
      flash[:errors]=@product.errors.full_messages
      redirect_to edit_product_path(@product)
    end
  end

  def destroy

    @product = Product.find(params[:id])
    if @product.destroy
      flash[:notice]="Successfuly Performed delete!"
      redirect_to products_path
    else  
      flash[:errors]=@product.errors.full_messages
      redirect_to new_product_path
    end
    
  end
end
