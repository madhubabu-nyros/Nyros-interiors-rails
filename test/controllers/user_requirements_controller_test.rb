require 'test_helper'

class UserRequirementsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_requirements_index_url
    assert_response :success
  end

  test "should get show" do
    get user_requirements_show_url
    assert_response :success
  end

  test "should get new" do
    get user_requirements_new_url
    assert_response :success
  end

  test "should get create" do
    get user_requirements_create_url
    assert_response :success
  end

  test "should get destroy" do
    get user_requirements_destroy_url
    assert_response :success
  end

end
