require 'test_helper'

class DepartmentMastersControllerTest < ActionController::TestCase
  setup do
    @department_master = department_masters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:department_masters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create department_master" do
    assert_difference('DepartmentMaster.count') do
      post :create, department_master: { active_status: @department_master.active_status, del_status: @department_master.del_status, department_name: @department_master.department_name, faculty_id: @department_master.faculty_id, user_id: @department_master.user_id }
    end

    assert_redirected_to department_master_path(assigns(:department_master))
  end

  test "should show department_master" do
    get :show, id: @department_master
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @department_master
    assert_response :success
  end

  test "should update department_master" do
    patch :update, id: @department_master, department_master: { active_status: @department_master.active_status, del_status: @department_master.del_status, department_name: @department_master.department_name, faculty_id: @department_master.faculty_id, user_id: @department_master.user_id }
    assert_redirected_to department_master_path(assigns(:department_master))
  end

  test "should destroy department_master" do
    assert_difference('DepartmentMaster.count', -1) do
      delete :destroy, id: @department_master
    end

    assert_redirected_to department_masters_path
  end
end
