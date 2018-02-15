require 'test_helper'

class FacultyMastersControllerTest < ActionController::TestCase
  setup do
    @faculty_master = faculty_masters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:faculty_masters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create faculty_master" do
    assert_difference('FacultyMaster.count') do
      post :create, faculty_master: { active_status: @faculty_master.active_status, del_status: @faculty_master.del_status, faculty_name: @faculty_master.faculty_name, user_id: @faculty_master.user_id }
    end

    assert_redirected_to faculty_master_path(assigns(:faculty_master))
  end

  test "should show faculty_master" do
    get :show, id: @faculty_master
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @faculty_master
    assert_response :success
  end

  test "should update faculty_master" do
    patch :update, id: @faculty_master, faculty_master: { active_status: @faculty_master.active_status, del_status: @faculty_master.del_status, faculty_name: @faculty_master.faculty_name, user_id: @faculty_master.user_id }
    assert_redirected_to faculty_master_path(assigns(:faculty_master))
  end

  test "should destroy faculty_master" do
    assert_difference('FacultyMaster.count', -1) do
      delete :destroy, id: @faculty_master
    end

    assert_redirected_to faculty_masters_path
  end
end
