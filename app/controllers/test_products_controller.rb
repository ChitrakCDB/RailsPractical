class TestProductsController < ApplicationController

  before_action :authenticate_renduser!
  def index
    @testproducts = TestProduct.all
  end

  def new
    @testproduct = TestProduct.new
  end

  def create
    @testproduct = TestProduct.create(testproduct_params)
    if @testproduct.valid?
      flash[:notice] = "Successfully performed create!"
      redirect_to test_products_path
    else   
      flash[:errors] = @testproduct.error.full_messages
      render :new
    end
  end

  def show
    @testproduct = TestProduct.find(params[:id])
  end

  def edit
    @testproduct = TestProduct.find(params[:id])
  end

  def update
    @testproduct = TestProduct.find(params[:id])
    if @testproduct.update(testproduct_params)
      flash[:notice] = "Successfully Performed update!"
      redirect_to test_product_path(@testproduct)
    else   
      flash[:errors] = @testproduct.errors.full_messages
      render :edit
    end
  end

  def destroy
    @testproduct = TestProduct.find(params[:id])
    if @testproduct.destroy
      flash[:notice] = "Successfully Performed delete!"
      redirect_to test_products_path
    else   
      flash[:errors] = @testproduct.errors.full_messages
      render :new
    end
  end

  private
  def testproduct_params
    params.require(:test_product).permit(:product_name,:price,:description,:renduser_id)
  end
end
