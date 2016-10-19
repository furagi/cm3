require 'test_helper'

class Gtf::ImageFilesControllerTest < ActionController::TestCase
  setup do
    @gtf_image_file = gtf_image_files(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gtf_image_files)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gtf_image_file" do
    assert_difference('Gtf::ImageFile.count') do
      post :create, gtf_image_file: {  }
    end

    assert_redirected_to gtf_image_file_path(assigns(:gtf_image_file))
  end

  test "should show gtf_image_file" do
    get :show, id: @gtf_image_file
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @gtf_image_file
    assert_response :success
  end

  test "should update gtf_image_file" do
    patch :update, id: @gtf_image_file, gtf_image_file: {  }
    assert_redirected_to gtf_image_file_path(assigns(:gtf_image_file))
  end

  test "should destroy gtf_image_file" do
    assert_difference('Gtf::ImageFile.count', -1) do
      delete :destroy, id: @gtf_image_file
    end

    assert_redirected_to gtf_image_files_path
  end
end
