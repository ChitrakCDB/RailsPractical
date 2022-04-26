require "test_helper"

class MyemployeesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get myemployees_index_url
    assert_response :success
  end

  test "should get new" do
    get myemployees_new_url
    assert_response :success
  end

  test "should get create" do
    get myemployees_create_url
    assert_response :success
  end

  test "should get show" do
    get myemployees_show_url
    assert_response :success
  end

  test "should get edit" do
    get myemployees_edit_url
    assert_response :success
  end

  test "should get update" do
    get myemployees_update_url
    assert_response :success
  end

  test "should get destroy" do
    get myemployees_destroy_url
    assert_response :success
  end
end
