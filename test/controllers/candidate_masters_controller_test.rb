require 'test_helper'

class CandidateMastersControllerTest < ActionController::TestCase
  setup do
    @candidate_master = candidate_masters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:candidate_masters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create candidate_master" do
    assert_difference('CandidateMaster.count') do
      post :create, candidate_master: { active_status: @candidate_master.active_status, del_status: @candidate_master.del_status, portfolio_id: @candidate_master.portfolio_id, user_id: @candidate_master.user_id, voter_id: @candidate_master.voter_id }
    end

    assert_redirected_to candidate_master_path(assigns(:candidate_master))
  end

  test "should show candidate_master" do
    get :show, id: @candidate_master
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @candidate_master
    assert_response :success
  end

  test "should update candidate_master" do
    patch :update, id: @candidate_master, candidate_master: { active_status: @candidate_master.active_status, del_status: @candidate_master.del_status, portfolio_id: @candidate_master.portfolio_id, user_id: @candidate_master.user_id, voter_id: @candidate_master.voter_id }
    assert_redirected_to candidate_master_path(assigns(:candidate_master))
  end

  test "should destroy candidate_master" do
    assert_difference('CandidateMaster.count', -1) do
      delete :destroy, id: @candidate_master
    end

    assert_redirected_to candidate_masters_path
  end
end
