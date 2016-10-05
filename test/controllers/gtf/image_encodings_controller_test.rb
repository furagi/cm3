require 'test_helper'

class Gtf::ImageEncodingsControllerTest < ActionController::TestCase
  setup do
    @gtf_image_encoding = gtf_image_encodings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gtf_image_encodings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gtf_image_encoding" do
    assert_difference('Gtf::ImageEncoding.count') do
      post :create, gtf_image_encoding: {  }
    end

    assert_redirected_to gtf_image_encoding_path(assigns(:gtf_image_encoding))
  end

  test "should show gtf_image_encoding" do
    get :show, id: @gtf_image_encoding
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @gtf_image_encoding
    assert_response :success
  end

  test "should update gtf_image_encoding" do
    patch :update, id: @gtf_image_encoding, gtf_image_encoding: {  }
    assert_redirected_to gtf_image_encoding_path(assigns(:gtf_image_encoding))
  end

  test "should destroy gtf_image_encoding" do
    assert_difference('Gtf::ImageEncoding.count', -1) do
      delete :destroy, id: @gtf_image_encoding
    end

    assert_redirected_to gtf_image_encodings_path
  end
end
