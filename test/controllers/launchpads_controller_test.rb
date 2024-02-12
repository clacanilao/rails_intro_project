require "test_helper"

class LaunchpadsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get launchpads_index_url
    assert_response :success
  end

  test "should get show" do
    get launchpads_show_url
    assert_response :success
  end
end
