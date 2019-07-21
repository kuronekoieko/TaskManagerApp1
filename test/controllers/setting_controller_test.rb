require 'test_helper'

class SettingControllerTest < ActionDispatch::IntegrationTest
  test "should get setting" do
    get setting_setting_url
    assert_response :success
  end

end
