class ProductsController < ApplicationController
  
  # GET method to get all products from database   
  def index
    @products = Product.all
  end

  # GET method for the new product form
  def new
    @product = Product.new
  end

  # POST method for processing form data
  def create
    @product = Product.create(params.require(:product).permit(:name, :price, :brand))
    if @product.valid?
      flash[:notice] = "Successfuly Performed create!"
      redirect_to products_path
    else 
      flash[:errors] = @product.errors.full_messages
      redirect_to new_product_path
    end
  end

  # GET method to get a product by id
  def show
    @product = Product.find(params[:id])
  end

  # GET method for editing a product based on id
  def edit
    @product = Product.find(params[:id])
  end

  # PUT method for updating in database a product based on id   
  def update
    @product = Product.find(params[:id])
    if @product.update(params.require(:product).permit(:name, :price, :brand))
      flash[:notice] = "Successfuly Performed Update!"
      
      redirect_to product_path(@product)
    else
      flash[:errors] = @product.errors.full_messages
      redirect_to edit_product_path(@product)
    end
  end

  # DELETE method for deleting a product from database based on id   
  def destroy
    @product = Product.find(params[:id])
    if @product.destroy
      flash[:notice] = "Successfuly Performed delete!"
      redirect_to products_path
    else  
      flash[:errors] = @product.errors.full_messages
      redirect_to new_product_path
    end 
  end
end
