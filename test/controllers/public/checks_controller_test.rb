require "test_helper"

class Public::ChecksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_checks_index_url
    assert_response :success
  end

  test "should get new" do
    get public_checks_new_url
    assert_response :success
  end

  test "should get create" do
    get public_checks_create_url
    assert_response :success
  end

  test "should get show" do
    get public_checks_show_url
    assert_response :success
  end
end
