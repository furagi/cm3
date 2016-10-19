require 'test_helper'

class Gtf::StoragesControllerTest < ActionController::TestCase
  setup do
    @gtf_storage = gtf_storages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gtf_storages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gtf_storage" do
    assert_difference('Gtf::Storage.count') do
      post :create, gtf_storage: {  }
    end

    assert_redirected_to gtf_storage_path(assigns(:gtf_storage))
  end

  test "should show gtf_storage" do
    get :show, id: @gtf_storage
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @gtf_storage
    assert_response :success
  end

  test "should update gtf_storage" do
    patch :update, id: @gtf_storage, gtf_storage: {  }
    assert_redirected_to gtf_storage_path(assigns(:gtf_storage))
  end

  test "should destroy gtf_storage" do
    assert_difference('Gtf::Storage.count', -1) do
      delete :destroy, id: @gtf_storage
    end

    assert_redirected_to gtf_storages_path
  end
end
