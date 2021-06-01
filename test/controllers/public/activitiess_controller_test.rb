require 'test_helper'

class Public::ActivitiessControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_activitiess_index_url
    assert_response :success
  end

end
