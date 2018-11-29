require 'test_helper'

class ParticipatesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get participates_new_url
    assert_response :success
  end

  test "should get edit" do
    get participates_edit_url
    assert_response :success
  end

end
