require 'test_helper'

class Gtf::VideosControllerTest < ActionController::TestCase
  setup do
    @gtf_video = gtf_videos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gtf_videos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gtf_video" do
    assert_difference('Gtf::Video.count') do
      post :create, gtf_video: {  }
    end

    assert_redirected_to gtf_video_path(assigns(:gtf_video))
  end

  test "should show gtf_video" do
    get :show, id: @gtf_video
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @gtf_video
    assert_response :success
  end

  test "should update gtf_video" do
    patch :update, id: @gtf_video, gtf_video: {  }
    assert_redirected_to gtf_video_path(assigns(:gtf_video))
  end

  test "should destroy gtf_video" do
    assert_difference('Gtf::Video.count', -1) do
      delete :destroy, id: @gtf_video
    end

    assert_redirected_to gtf_videos_path
  end
end
