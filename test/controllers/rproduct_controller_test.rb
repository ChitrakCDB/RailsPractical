require "test_helper"

class RproductControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get rproduct_index_url
    assert_response :success
  end

  test "should get new" do
    get rproduct_new_url
    assert_response :success
  end

  test "should get create" do
    get rproduct_create_url
    assert_response :success
  end

  test "should get show" do
    get rproduct_show_url
    assert_response :success
  end

  test "should get edit" do
    get rproduct_edit_url
    assert_response :success
  end

  test "should get update" do
    get rproduct_update_url
    assert_response :success
  end

  test "should get destroy" do
    get rproduct_destroy_url
    assert_response :success
  end
end
