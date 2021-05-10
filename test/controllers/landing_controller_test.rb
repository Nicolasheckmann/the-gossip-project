require 'test_helper'

class LandingControllerTest < ActionDispatch::IntegrationTest
  test "should get welcome_user" do
    get landing_welcome_user_url
    assert_response :success
  end

end
