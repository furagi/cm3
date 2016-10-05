require 'test_helper'

class Gtf::MediaControllerTest < ActionController::TestCase
  setup do
    @gtf_medium = gtf_media(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gtf_media)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gtf_medium" do
    assert_difference('Gtf::Medium.count') do
      post :create, gtf_medium: {  }
    end

    assert_redirected_to gtf_medium_path(assigns(:gtf_medium))
  end

  test "should show gtf_medium" do
    get :show, id: @gtf_medium
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @gtf_medium
    assert_response :success
  end

  test "should update gtf_medium" do
    patch :update, id: @gtf_medium, gtf_medium: {  }
    assert_redirected_to gtf_medium_path(assigns(:gtf_medium))
  end

  test "should destroy gtf_medium" do
    assert_difference('Gtf::Medium.count', -1) do
      delete :destroy, id: @gtf_medium
    end

    assert_redirected_to gtf_media_path
  end
end
