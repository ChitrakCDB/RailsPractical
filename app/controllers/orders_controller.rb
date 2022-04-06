class OrdersController < ApplicationController
  def index
    self.searchProduct
    if params[:searchParam]
      @orders = Order.all
      @orders = Order.where(status:'Booked') if params[:searchParam] == 'Booked'
      @orders = Order.where(status:'Cancelled') if params[:searchParam] == 'Cancelled'
    else
      @orders = Order.all
    end

  end

  def new
    @order= Order.new
  end

  def create
    @order = Order.create(order_params)
    @temp= order_params[:myproduct_id]
    @myproduct_price = Myproduct.find(@temp)
    @order.total_price = @myproduct_price.price * @order.quantity
    if @order.valid?
      @order.save
      flash[:notice]="Successfuly Performed create!"
      redirect_to orders_path
    else 
      flash[:errors]=@order.errors.full_messages
      redirect_to new_order_path
    end

  end

  def show
    @order = Order.find(params[:id])
  end

  def edit
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      @temp= order_params[:myproduct_id]
      @myproduct_price = Myproduct.find(@temp)
      @order.total_price = @myproduct_price.price * @order.quantity
      @order.save
      flash[:notice]="Successfuly Performed Update!"
      redirect_to order_path(@order)
    else
      flash[:errors]=@order.errors.full_messages
      redirect_to edit_order_path(@order)
    end
  end

  def destroy

    @order = Order.find(params[:id])
    if @order.destroy
      flash[:notice]="Successfuly Performed delete!"
      redirect_to orders_path
    else  
      flash[:errors]=@order.errors.full_messages
      redirect_to new_order_path
    end
    
  end

  def searchProduct
    searchParam =[:search_Product,:filter_Product]
      if params[:searchParam]
        @searchorder_id=Order.where("myproduct_id=?",(Myproduct.where("title=?",params[:searchParam]).pluck(:id)))
      end
  end

  def root
    @topinQuantity = Order.select("customer_id, sum(quantity) as Sum_of_Quantity").group("customer_id").order(Sum_of_Quantity: :desc).first(3)
    @topinPrice = Order.select("customer_id, sum(total_price) as Sum_of_Price").group("customer_id").order(Sum_of_Price: :desc).first(3)
   
  end
  
  private
  def order_params
    params.require(:order).permit(:quantity, :total_price, :status, :customer_id, :myproduct_id)
  end

end

