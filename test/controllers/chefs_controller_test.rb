require 'test_helper'

class ChefsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get chefs_index_url
    assert_response :success
  end

  test "should get show" do
    get chefs_show_url
    assert_response :success
  end

  test "should get new" do
    get chefs_new_url
    assert_response :success
  end

  test "should get create" do
    get chefs_create_url
    assert_response :success
  end

  test "should get update" do
    get chefs_update_url
    assert_response :success
  end

  test "should get edit" do
    get chefs_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get chefs_destroy_url
    assert_response :success
  end

end
