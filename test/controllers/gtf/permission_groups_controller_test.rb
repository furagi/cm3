require 'test_helper'

class Gtf::PermissionGroupsControllerTest < ActionController::TestCase
  setup do
    @gtf_permission_group = gtf_permission_groups(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gtf_permission_groups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gtf_permission_group" do
    assert_difference('Gtf::PermissionGroup.count') do
      post :create, gtf_permission_group: {  }
    end

    assert_redirected_to gtf_permission_group_path(assigns(:gtf_permission_group))
  end

  test "should show gtf_permission_group" do
    get :show, id: @gtf_permission_group
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @gtf_permission_group
    assert_response :success
  end

  test "should update gtf_permission_group" do
    patch :update, id: @gtf_permission_group, gtf_permission_group: {  }
    assert_redirected_to gtf_permission_group_path(assigns(:gtf_permission_group))
  end

  test "should destroy gtf_permission_group" do
    assert_difference('Gtf::PermissionGroup.count', -1) do
      delete :destroy, id: @gtf_permission_group
    end

    assert_redirected_to gtf_permission_groups_path
  end
end
