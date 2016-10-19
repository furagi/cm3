require 'test_helper'

class Gtf::VideoEncodingsControllerTest < ActionController::TestCase
  setup do
    @gtf_video_encoding = gtf_video_encodings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gtf_video_encodings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gtf_video_encoding" do
    assert_difference('Gtf::VideoEncoding.count') do
      post :create, gtf_video_encoding: {  }
    end

    assert_redirected_to gtf_video_encoding_path(assigns(:gtf_video_encoding))
  end

  test "should show gtf_video_encoding" do
    get :show, id: @gtf_video_encoding
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @gtf_video_encoding
    assert_response :success
  end

  test "should update gtf_video_encoding" do
    patch :update, id: @gtf_video_encoding, gtf_video_encoding: {  }
    assert_redirected_to gtf_video_encoding_path(assigns(:gtf_video_encoding))
  end

  test "should destroy gtf_video_encoding" do
    assert_difference('Gtf::VideoEncoding.count', -1) do
      delete :destroy, id: @gtf_video_encoding
    end

    assert_redirected_to gtf_video_encodings_path
  end
end
