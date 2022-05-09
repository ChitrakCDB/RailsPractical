require "test_helper"

class RenduserTest < ActiveSupport::TestCase

  def setup
    @user = Renduser.new(email: 'test@railstest.com', role: 'admin', password: 'testpassword')
    @user.save
  end

  test "attributes should be valid" do
    assert @user.valid?
  end

  test "should not save without mail" do
    @user.email = ""
    assert_not @user.valid?
  end
  
  test "should not save without password" do
    @user.password = ""
    assert_not @user.valid?
  end

  test "should not save without role" do
    @user.role = ""
    assert_not @user.valid?
  end

end
