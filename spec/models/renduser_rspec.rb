require 'rails_helper'

RSpec.describe Renduser, type: :model do
  before do
    @user = Renduser.new(email: 'test@railstest.com', role: "admin", password: 'testpassword')
    @user.save
  end

  it "is valid with valid attributes" do
    expect(@user).to be_valid
  end
  
  it "is not valid without a email" do
    @user.email = " "
    expect(@user).to_not be_valid
  end

  it "is not valid without a Pasword" do
    @user.password = " "
    expect(@user).to_not be_valid
  end

  it "is not valid without a Role" do
    @user.role  = nil
    expect(@user).to_not be_valid
  end

end
