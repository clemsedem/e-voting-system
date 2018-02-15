require 'test_helper'

class VoteResultsControllerTest < ActionController::TestCase
  setup do
    @vote_result = vote_results(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vote_results)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vote_result" do
    assert_difference('VoteResult.count') do
      post :create, vote_result: { active_status: @vote_result.active_status, candidate_id: @vote_result.candidate_id, del_status: @vote_result.del_status, portfolio_id: @vote_result.portfolio_id, user_id: @vote_result.user_id, voter_id: @vote_result.voter_id }
    end

    assert_redirected_to vote_result_path(assigns(:vote_result))
  end

  test "should show vote_result" do
    get :show, id: @vote_result
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vote_result
    assert_response :success
  end

  test "should update vote_result" do
    patch :update, id: @vote_result, vote_result: { active_status: @vote_result.active_status, candidate_id: @vote_result.candidate_id, del_status: @vote_result.del_status, portfolio_id: @vote_result.portfolio_id, user_id: @vote_result.user_id, voter_id: @vote_result.voter_id }
    assert_redirected_to vote_result_path(assigns(:vote_result))
  end

  test "should destroy vote_result" do
    assert_difference('VoteResult.count', -1) do
      delete :destroy, id: @vote_result
    end

    assert_redirected_to vote_results_path
  end
end
