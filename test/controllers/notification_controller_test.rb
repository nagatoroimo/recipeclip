require 'test_helper'

class NotificationControllerTest < ActionDispatch::IntegrationTest
  test "should get link_through" do
    get notification_link_through_url
    assert_response :success
  end

end
