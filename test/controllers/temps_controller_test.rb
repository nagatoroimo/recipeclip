require 'test_helper'

class TempsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get temps_index_url
    assert_response :success
  end

end
