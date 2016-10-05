require 'test_helper'

class Gtf::UploadsControllerTest < ActionController::TestCase
  setup do
    @gtf_upload = gtf_uploads(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gtf_uploads)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gtf_upload" do
    assert_difference('Gtf::Upload.count') do
      post :create, gtf_upload: {  }
    end

    assert_redirected_to gtf_upload_path(assigns(:gtf_upload))
  end

  test "should show gtf_upload" do
    get :show, id: @gtf_upload
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @gtf_upload
    assert_response :success
  end

  test "should update gtf_upload" do
    patch :update, id: @gtf_upload, gtf_upload: {  }
    assert_redirected_to gtf_upload_path(assigns(:gtf_upload))
  end

  test "should destroy gtf_upload" do
    assert_difference('Gtf::Upload.count', -1) do
      delete :destroy, id: @gtf_upload
    end

    assert_redirected_to gtf_uploads_path
  end
end
