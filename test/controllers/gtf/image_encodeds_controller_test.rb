require 'test_helper'

class Gtf::ImageEncodedsControllerTest < ActionController::TestCase
  setup do
    @gtf_image_encoded = gtf_image_encodeds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gtf_image_encodeds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gtf_image_encoded" do
    assert_difference('Gtf::ImageEncoded.count') do
      post :create, gtf_image_encoded: {  }
    end

    assert_redirected_to gtf_image_encoded_path(assigns(:gtf_image_encoded))
  end

  test "should show gtf_image_encoded" do
    get :show, id: @gtf_image_encoded
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @gtf_image_encoded
    assert_response :success
  end

  test "should update gtf_image_encoded" do
    patch :update, id: @gtf_image_encoded, gtf_image_encoded: {  }
    assert_redirected_to gtf_image_encoded_path(assigns(:gtf_image_encoded))
  end

  test "should destroy gtf_image_encoded" do
    assert_difference('Gtf::ImageEncoded.count', -1) do
      delete :destroy, id: @gtf_image_encoded
    end

    assert_redirected_to gtf_image_encodeds_path
  end
end
