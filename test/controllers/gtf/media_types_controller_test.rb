require 'test_helper'

class Gtf::MediaTypesControllerTest < ActionController::TestCase
  setup do
    @gtf_media_type = gtf_media_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gtf_media_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gtf_media_type" do
    assert_difference('Gtf::MediaType.count') do
      post :create, gtf_media_type: {  }
    end

    assert_redirected_to gtf_media_type_path(assigns(:gtf_media_type))
  end

  test "should show gtf_media_type" do
    get :show, id: @gtf_media_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @gtf_media_type
    assert_response :success
  end

  test "should update gtf_media_type" do
    patch :update, id: @gtf_media_type, gtf_media_type: {  }
    assert_redirected_to gtf_media_type_path(assigns(:gtf_media_type))
  end

  test "should destroy gtf_media_type" do
    assert_difference('Gtf::MediaType.count', -1) do
      delete :destroy, id: @gtf_media_type
    end

    assert_redirected_to gtf_media_types_path
  end
end
