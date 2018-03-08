require 'test_helper'

class BusinessesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get businesses_show_url
    assert_response :success
  end

end
