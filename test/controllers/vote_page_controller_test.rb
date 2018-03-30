require 'test_helper'

class VotePageControllerTest < ActionController::TestCase
  test "should get president" do
    get :president
    assert_response :success
  end

end
