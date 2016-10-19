require 'test_helper'

class Gtf::ImagesControllerTest < ActionController::TestCase
  setup do
    @gtf_image = gtf_images(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gtf_images)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gtf_image" do
    assert_difference('Gtf::Image.count') do
      post :create, gtf_image: {  }
    end

    assert_redirected_to gtf_image_path(assigns(:gtf_image))
  end

  test "should show gtf_image" do
    get :show, id: @gtf_image
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @gtf_image
    assert_response :success
  end

  test "should update gtf_image" do
    patch :update, id: @gtf_image, gtf_image: {  }
    assert_redirected_to gtf_image_path(assigns(:gtf_image))
  end

  test "should destroy gtf_image" do
    assert_difference('Gtf::Image.count', -1) do
      delete :destroy, id: @gtf_image
    end

    assert_redirected_to gtf_images_path
  end
end
