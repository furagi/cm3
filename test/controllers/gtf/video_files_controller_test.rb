require 'test_helper'

class Gtf::VideoFilesControllerTest < ActionController::TestCase
  setup do
    @gtf_video_file = gtf_video_files(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gtf_video_files)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gtf_video_file" do
    assert_difference('Gtf::VideoFile.count') do
      post :create, gtf_video_file: {  }
    end

    assert_redirected_to gtf_video_file_path(assigns(:gtf_video_file))
  end

  test "should show gtf_video_file" do
    get :show, id: @gtf_video_file
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @gtf_video_file
    assert_response :success
  end

  test "should update gtf_video_file" do
    patch :update, id: @gtf_video_file, gtf_video_file: {  }
    assert_redirected_to gtf_video_file_path(assigns(:gtf_video_file))
  end

  test "should destroy gtf_video_file" do
    assert_difference('Gtf::VideoFile.count', -1) do
      delete :destroy, id: @gtf_video_file
    end

    assert_redirected_to gtf_video_files_path
  end
end
