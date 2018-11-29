require 'test_helper'

class JukeboxControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get jukebox_index_url
    assert_response :success
  end

end
