require 'test_helper'

class UserRequirementStylesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_requirement_styles_index_url
    assert_response :success
  end

  test "should get show" do
    get user_requirement_styles_show_url
    assert_response :success
  end

  test "should get new" do
    get user_requirement_styles_new_url
    assert_response :success
  end

  test "should get create" do
    get user_requirement_styles_create_url
    assert_response :success
  end

  test "should get destroy" do
    get user_requirement_styles_destroy_url
    assert_response :success
  end

end
