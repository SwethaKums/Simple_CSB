require "test_helper"

class CollgegeControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get collgege_new_url
    assert_response :success
  end

  test "should get show" do
    get collgege_show_url
    assert_response :success
  end

  test "should get index" do
    get collgege_index_url
    assert_response :success
  end

  test "should get edit" do
    get collgege_edit_url
    assert_response :success
  end

  test "should get delete" do
    get collgege_delete_url
    assert_response :success
  end
end
