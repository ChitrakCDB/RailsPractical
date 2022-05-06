require 'rails_helper'

RSpec.describe TestProduct, type: :model do
  before do
    @user = Renduser.new(email: 'test@railstest.com', role: 'admin', password: 'testpassword')
    @user.save
    @product = @user.test_products.new(product_name: 'testProduct', description: 'testProduct Description',price: 450)
    @product.save
  end

  it "is valid with valid attributes" do
    expect(@product).to be_valid
  end
  
  it "is not valid without a name" do
    @product.product_name = " "
    expect(@product).to_not be_valid
  end

  it "is not valid without a Description" do
    @product.description = " "
    expect(@product).to_not be_valid
  end

  it "is not valid without a Price" do
    @product.price  = nil
    expect(@product).to_not be_valid
  end

  it "is not valid without a user id" do
    @product.renduser_id = " "
    expect(@product).to_not be_valid
  end

end
