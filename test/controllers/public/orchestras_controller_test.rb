require 'test_helper'

class Public::OrchestrasControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get public_orchestras_create_url
    assert_response :success
  end

  test "should get show" do
    get public_orchestras_show_url
    assert_response :success
  end

end
