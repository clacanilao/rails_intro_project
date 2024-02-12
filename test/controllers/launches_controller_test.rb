require "test_helper"

class LaunchesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get launches_index_url
    assert_response :success
  end

  test "should get show" do
    get launches_show_url
    assert_response :success
  end
end
