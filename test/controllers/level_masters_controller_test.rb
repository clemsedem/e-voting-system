require 'test_helper'

class LevelMastersControllerTest < ActionController::TestCase
  setup do
    @level_master = level_masters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:level_masters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create level_master" do
    assert_difference('LevelMaster.count') do
      post :create, level_master: { active_status: @level_master.active_status, del_status: @level_master.del_status, level: @level_master.level, user_id: @level_master.user_id }
    end

    assert_redirected_to level_master_path(assigns(:level_master))
  end

  test "should show level_master" do
    get :show, id: @level_master
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @level_master
    assert_response :success
  end

  test "should update level_master" do
    patch :update, id: @level_master, level_master: { active_status: @level_master.active_status, del_status: @level_master.del_status, level: @level_master.level, user_id: @level_master.user_id }
    assert_redirected_to level_master_path(assigns(:level_master))
  end

  test "should destroy level_master" do
    assert_difference('LevelMaster.count', -1) do
      delete :destroy, id: @level_master
    end

    assert_redirected_to level_masters_path
  end
end
