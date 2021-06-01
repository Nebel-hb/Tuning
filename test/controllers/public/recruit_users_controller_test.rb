require 'test_helper'

class Public::RecruitUsersControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get public_recruit_users_create_url
    assert_response :success
  end

  test "should get index" do
    get public_recruit_users_index_url
    assert_response :success
  end

end
