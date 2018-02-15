require 'test_helper'

class GenderMastersControllerTest < ActionController::TestCase
  setup do
    @gender_master = gender_masters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gender_masters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gender_master" do
    assert_difference('GenderMaster.count') do
      post :create, gender_master: { active_status: @gender_master.active_status, del_status: @gender_master.del_status, gender: @gender_master.gender, user_id: @gender_master.user_id }
    end

    assert_redirected_to gender_master_path(assigns(:gender_master))
  end

  test "should show gender_master" do
    get :show, id: @gender_master
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @gender_master
    assert_response :success
  end

  test "should update gender_master" do
    patch :update, id: @gender_master, gender_master: { active_status: @gender_master.active_status, del_status: @gender_master.del_status, gender: @gender_master.gender, user_id: @gender_master.user_id }
    assert_redirected_to gender_master_path(assigns(:gender_master))
  end

  test "should destroy gender_master" do
    assert_difference('GenderMaster.count', -1) do
      delete :destroy, id: @gender_master
    end

    assert_redirected_to gender_masters_path
  end
end
