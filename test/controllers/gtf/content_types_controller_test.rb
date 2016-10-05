require 'test_helper'

class Gtf::ContentTypesControllerTest < ActionController::TestCase
  setup do
    @gtf_content_type = gtf_content_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gtf_content_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gtf_content_type" do
    assert_difference('Gtf::ContentType.count') do
      post :create, gtf_content_type: {  }
    end

    assert_redirected_to gtf_content_type_path(assigns(:gtf_content_type))
  end

  test "should show gtf_content_type" do
    get :show, id: @gtf_content_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @gtf_content_type
    assert_response :success
  end

  test "should update gtf_content_type" do
    patch :update, id: @gtf_content_type, gtf_content_type: {  }
    assert_redirected_to gtf_content_type_path(assigns(:gtf_content_type))
  end

  test "should destroy gtf_content_type" do
    assert_difference('Gtf::ContentType.count', -1) do
      delete :destroy, id: @gtf_content_type
    end

    assert_redirected_to gtf_content_types_path
  end
end
