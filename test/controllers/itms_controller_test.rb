require 'test_helper'

class ItmsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get itms_index_url
    assert_response :success
  end

end
