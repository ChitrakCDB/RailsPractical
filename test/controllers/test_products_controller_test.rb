require "test_helper"

class TestProductsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  def setup
    @user = Renduser.new(email: "test@testing.ciom",role: "admin",password: "test@123")
    @user.save
    sign_in @user
    @product = @user.test_products.new(product_name: "test", description: "dummy", price: 600)
    @product.save
  end

  # setup do
  #   get '/myusers/sign_in'
  #   sign_in myusers(:myuser_001)
  #   post myuser_session_url
  # end
  
  test "should get index" do
    get test_products_path
    assert_response :success
  end

  test "should get new" do
    get new_test_product_path
    assert_response :success
  end

  test "should create product" do
    #binding.pry
    assert_difference('TestProduct.count') do
      post test_products_path, params: { test_product: {product_name: "CreatePro", description: "Create desc", price: 700, renduser_id: @user.id }}
    end
    assert_redirected_to test_products_path
  end

  test "should get edit" do
    get edit_test_product_path(@product)
    assert_response :success
  end

  test "should get show" do
    get test_product_path(@product)
    assert_response :success
  end

  test "should update product" do
    @product.update(:product_name => "UpdatePro")
    assert TestProduct.find_by(product_name: 'UpdatePro')
    assert_equal "UpdatePro", @product.product_name
  end

  test "should get delete" do
    delete test_product_path(@product)
    assert_nil(TestProduct.find_by(product_name:"DeletePro"))
  end
end
