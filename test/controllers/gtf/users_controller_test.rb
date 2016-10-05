require 'test_helper'

class Gtf::UsersControllerTest < ActionController::TestCase
  setup do
    @gtf_user = gtf_users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gtf_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gtf_user" do
    assert_difference('Gtf::User.count') do
      post :create, gtf_user: {  }
    end

    assert_redirected_to gtf_user_path(assigns(:gtf_user))
  end

  test "should show gtf_user" do
    get :show, id: @gtf_user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @gtf_user
    assert_response :success
  end

  test "should update gtf_user" do
    patch :update, id: @gtf_user, gtf_user: {  }
    assert_redirected_to gtf_user_path(assigns(:gtf_user))
  end

  test "should destroy gtf_user" do
    assert_difference('Gtf::User.count', -1) do
      delete :destroy, id: @gtf_user
    end

    assert_redirected_to gtf_users_path
  end
end
