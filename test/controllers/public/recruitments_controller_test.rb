require 'test_helper'

class Public::RecruitmentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_recruitments_index_url
    assert_response :success
  end

  test "should get show" do
    get public_recruitments_show_url
    assert_response :success
  end

  test "should get edit" do
    get public_recruitments_edit_url
    assert_response :success
  end

  test "should get update" do
    get public_recruitments_update_url
    assert_response :success
  end

  test "should get create" do
    get public_recruitments_create_url
    assert_response :success
  end

  test "should get destroy" do
    get public_recruitments_destroy_url
    assert_response :success
  end

  test "should get confirm" do
    get public_recruitments_confirm_url
    assert_response :success
  end

end
