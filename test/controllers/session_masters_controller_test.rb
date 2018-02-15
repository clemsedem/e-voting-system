require 'test_helper'

class SessionMastersControllerTest < ActionController::TestCase
  setup do
    @session_master = session_masters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:session_masters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create session_master" do
    assert_difference('SessionMaster.count') do
      post :create, session_master: { active_status: @session_master.active_status, del_status: @session_master.del_status, session: @session_master.session, user_id: @session_master.user_id }
    end

    assert_redirected_to session_master_path(assigns(:session_master))
  end

  test "should show session_master" do
    get :show, id: @session_master
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @session_master
    assert_response :success
  end

  test "should update session_master" do
    patch :update, id: @session_master, session_master: { active_status: @session_master.active_status, del_status: @session_master.del_status, session: @session_master.session, user_id: @session_master.user_id }
    assert_redirected_to session_master_path(assigns(:session_master))
  end

  test "should destroy session_master" do
    assert_difference('SessionMaster.count', -1) do
      delete :destroy, id: @session_master
    end

    assert_redirected_to session_masters_path
  end
end
