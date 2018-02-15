require 'test_helper'

class ProgramMastersControllerTest < ActionController::TestCase
  setup do
    @program_master = program_masters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:program_masters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create program_master" do
    assert_difference('ProgramMaster.count') do
      post :create, program_master: { active_status: @program_master.active_status, del_status: @program_master.del_status, department_id: @program_master.department_id, program_name: @program_master.program_name, user_id: @program_master.user_id }
    end

    assert_redirected_to program_master_path(assigns(:program_master))
  end

  test "should show program_master" do
    get :show, id: @program_master
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @program_master
    assert_response :success
  end

  test "should update program_master" do
    patch :update, id: @program_master, program_master: { active_status: @program_master.active_status, del_status: @program_master.del_status, department_id: @program_master.department_id, program_name: @program_master.program_name, user_id: @program_master.user_id }
    assert_redirected_to program_master_path(assigns(:program_master))
  end

  test "should destroy program_master" do
    assert_difference('ProgramMaster.count', -1) do
      delete :destroy, id: @program_master
    end

    assert_redirected_to program_masters_path
  end
end
