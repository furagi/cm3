require 'test_helper'

class Gtf::UploadExtensionsControllerTest < ActionController::TestCase
  setup do
    @gtf_upload_extension = gtf_upload_extensions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gtf_upload_extensions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gtf_upload_extension" do
    assert_difference('Gtf::UploadExtension.count') do
      post :create, gtf_upload_extension: {  }
    end

    assert_redirected_to gtf_upload_extension_path(assigns(:gtf_upload_extension))
  end

  test "should show gtf_upload_extension" do
    get :show, id: @gtf_upload_extension
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @gtf_upload_extension
    assert_response :success
  end

  test "should update gtf_upload_extension" do
    patch :update, id: @gtf_upload_extension, gtf_upload_extension: {  }
    assert_redirected_to gtf_upload_extension_path(assigns(:gtf_upload_extension))
  end

  test "should destroy gtf_upload_extension" do
    assert_difference('Gtf::UploadExtension.count', -1) do
      delete :destroy, id: @gtf_upload_extension
    end

    assert_redirected_to gtf_upload_extensions_path
  end
end
