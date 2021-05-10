require 'test_helper'

class UserControllerTest < ActionDispatch::IntegrationTest
  test "should get profil" do
    get user_profil_url
    assert_response :success
  end

end
