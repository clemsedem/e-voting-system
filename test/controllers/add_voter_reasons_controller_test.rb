require 'test_helper'

class AddVoterReasonsControllerTest < ActionController::TestCase
  setup do
    @add_voter_reason = add_voter_reasons(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:add_voter_reasons)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create add_voter_reason" do
    assert_difference('AddVoterReason.count') do
      post :create, add_voter_reason: { reason: @add_voter_reason.reason, user_id: @add_voter_reason.user_id, voter_id: @add_voter_reason.voter_id }
    end

    assert_redirected_to add_voter_reason_path(assigns(:add_voter_reason))
  end

  test "should show add_voter_reason" do
    get :show, id: @add_voter_reason
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @add_voter_reason
    assert_response :success
  end

  test "should update add_voter_reason" do
    patch :update, id: @add_voter_reason, add_voter_reason: { reason: @add_voter_reason.reason, user_id: @add_voter_reason.user_id, voter_id: @add_voter_reason.voter_id }
    assert_redirected_to add_voter_reason_path(assigns(:add_voter_reason))
  end

  test "should destroy add_voter_reason" do
    assert_difference('AddVoterReason.count', -1) do
      delete :destroy, id: @add_voter_reason
    end

    assert_redirected_to add_voter_reasons_path
  end
end
