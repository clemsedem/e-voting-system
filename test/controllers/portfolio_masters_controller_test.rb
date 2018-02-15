require 'test_helper'

class PortfolioMastersControllerTest < ActionController::TestCase
  setup do
    @portfolio_master = portfolio_masters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:portfolio_masters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create portfolio_master" do
    assert_difference('PortfolioMaster.count') do
      post :create, portfolio_master: { active_status: @portfolio_master.active_status, del_status: @portfolio_master.del_status, portfolio: @portfolio_master.portfolio, ref_id: @portfolio_master.ref_id, user_id: @portfolio_master.user_id }
    end

    assert_redirected_to portfolio_master_path(assigns(:portfolio_master))
  end

  test "should show portfolio_master" do
    get :show, id: @portfolio_master
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @portfolio_master
    assert_response :success
  end

  test "should update portfolio_master" do
    patch :update, id: @portfolio_master, portfolio_master: { active_status: @portfolio_master.active_status, del_status: @portfolio_master.del_status, portfolio: @portfolio_master.portfolio, ref_id: @portfolio_master.ref_id, user_id: @portfolio_master.user_id }
    assert_redirected_to portfolio_master_path(assigns(:portfolio_master))
  end

  test "should destroy portfolio_master" do
    assert_difference('PortfolioMaster.count', -1) do
      delete :destroy, id: @portfolio_master
    end

    assert_redirected_to portfolio_masters_path
  end
end
