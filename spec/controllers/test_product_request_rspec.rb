require 'rails_helper'

RSpec.describe TestProduct, type: :request do
  
  before do
    @user = Renduser.new(email: 'test@railstest.com', role: 'admin', password: 'testpassword')
    @user.save
    #binding.pry
    sign_in @user
    @product = @user.test_products.new(product_name: 'testProduct', description: 'testProduct Description',price: 450)
    @product.save
  end

  it "new path" do
    get new_test_product_path
    expect(response).to be_successful
  end

  it "index path" do
    get test_products_path
    expect(response).to be_successful
  end

  it "Edit path" do
    get edit_test_product_path(@product)
    expect(response).to be_successful
  end

  it "show path" do
    get test_product_path(@product)
    expect(response).to be_successful
  end

  it "update path" do
    @product.update(:product_name => "UpdatedTest")
    expect(TestProduct.find_by(product_name:"UpdatedTest")).to eq(@product)
  end
   
  it "create path" do 
    expect do
      post '/test_products',params:{test_product:{product_name: "testcreate",description:"dummydesc",price:50,renduser_id: @user.id }}
      end.to change(TestProduct, :count).by(1)
    expect(response).to have_http_status(:redirect)
  end
  
  it "Delete path" do
    @product.destroy  
    expect(TestProduct.find_by(product_name: "DummyDelete")).to be_nil
  end
end
