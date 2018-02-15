require 'test_helper'

class VoterTokensControllerTest < ActionController::TestCase
  setup do
    @voter_token = voter_tokens(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:voter_tokens)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create voter_token" do
    assert_difference('VoterToken.count') do
      post :create, voter_token: { active_status: @voter_token.active_status, del_status: @voter_token.del_status, token: @voter_token.token, user_id: @voter_token.user_id, voter_id: @voter_token.voter_id }
    end

    assert_redirected_to voter_token_path(assigns(:voter_token))
  end

  test "should show voter_token" do
    get :show, id: @voter_token
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @voter_token
    assert_response :success
  end

  test "should update voter_token" do
    patch :update, id: @voter_token, voter_token: { active_status: @voter_token.active_status, del_status: @voter_token.del_status, token: @voter_token.token, user_id: @voter_token.user_id, voter_id: @voter_token.voter_id }
    assert_redirected_to voter_token_path(assigns(:voter_token))
  end

  test "should destroy voter_token" do
    assert_difference('VoterToken.count', -1) do
      delete :destroy, id: @voter_token
    end

    assert_redirected_to voter_tokens_path
  end
end
