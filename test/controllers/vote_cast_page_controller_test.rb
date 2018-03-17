require 'test_helper'

class VoteCastPageControllerTest < ActionController::TestCase
  test "should get voter_valid" do
    get :voter_valid
    assert_response :success
  end

end
