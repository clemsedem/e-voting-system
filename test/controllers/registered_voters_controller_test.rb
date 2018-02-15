require 'test_helper'

class RegisteredVotersControllerTest < ActionController::TestCase
  setup do
    @registered_voter = registered_voters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:registered_voters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create registered_voter" do
    assert_difference('RegisteredVoter.count') do
      post :create, registered_voter: { active_status: @registered_voter.active_status, del_status: @registered_voter.del_status, gender_id: @registered_voter.gender_id, level_id: @registered_voter.level_id, other_names: @registered_voter.other_names, program_id: @registered_voter.program_id, session_id: @registered_voter.session_id, surname: @registered_voter.surname, user_id: @registered_voter.user_id, vote_status: @registered_voter.vote_status, voter_id: @registered_voter.voter_id }
    end

    assert_redirected_to registered_voter_path(assigns(:registered_voter))
  end

  test "should show registered_voter" do
    get :show, id: @registered_voter
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @registered_voter
    assert_response :success
  end

  test "should update registered_voter" do
    patch :update, id: @registered_voter, registered_voter: { active_status: @registered_voter.active_status, del_status: @registered_voter.del_status, gender_id: @registered_voter.gender_id, level_id: @registered_voter.level_id, other_names: @registered_voter.other_names, program_id: @registered_voter.program_id, session_id: @registered_voter.session_id, surname: @registered_voter.surname, user_id: @registered_voter.user_id, vote_status: @registered_voter.vote_status, voter_id: @registered_voter.voter_id }
    assert_redirected_to registered_voter_path(assigns(:registered_voter))
  end

  test "should destroy registered_voter" do
    assert_difference('RegisteredVoter.count', -1) do
      delete :destroy, id: @registered_voter
    end

    assert_redirected_to registered_voters_path
  end
end
