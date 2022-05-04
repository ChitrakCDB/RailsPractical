require "test_helper"

class ActionMailerUsersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get action_mailer_users_index_url
    assert_response :success
  end

  test "should get new" do
    get action_mailer_users_new_url
    assert_response :success
  end

  test "should get create" do
    get action_mailer_users_create_url
    assert_response :success
  end

  test "should get show" do
    get action_mailer_users_show_url
    assert_response :success
  end

  test "should get edit" do
    get action_mailer_users_edit_url
    assert_response :success
  end

  test "should get update" do
    get action_mailer_users_update_url
    assert_response :success
  end

  test "should get destroy" do
    get action_mailer_users_destroy_url
    assert_response :success
  end
end
