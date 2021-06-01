require 'test_helper'

class Public::ChatsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_chats_index_url
    assert_response :success
  end

  test "should get create" do
    get public_chats_create_url
    assert_response :success
  end

end
