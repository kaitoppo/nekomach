require "test_helper"

class Admin::PostMachinekoesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_post_machinekoes_new_url
    assert_response :success
  end

  test "should get index" do
    get admin_post_machinekoes_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_post_machinekoes_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_post_machinekoes_edit_url
    assert_response :success
  end

  test "should get matchineko_search" do
    get admin_post_machinekoes_matchineko_search_url
    assert_response :success
  end
end
