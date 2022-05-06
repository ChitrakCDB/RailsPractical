require "test_helper"

class TestProductTest < ActiveSupport::TestCase
  
  def setup
    @user = Renduser.new(email: 'test@railstest.com', role: 'admin', password: 'testpassword')
    @user.save
    @product = @user.test_products.new(product_name: 'testProduct', description: 'testProduct Description',price: 450)
    #@product.save
  end

  test "attributes should be valid" do
    assert @product.valid?
  end

  test "should not save without name" do
    @product.product_name = ""
    assert_not @product.valid?
  end
  
  test "should not save without price" do
    @product.price = ""
    assert_not @product.valid?
  end

  test "should not save without myuser_id" do
    @product.renduser_id = ""
    assert_not @product.valid?
  end
  
end
