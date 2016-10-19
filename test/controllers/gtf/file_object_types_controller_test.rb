require 'test_helper'

class Gtf::FileObjectTypesControllerTest < ActionController::TestCase
  setup do
    @gtf_file_object_type = gtf_file_object_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gtf_file_object_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gtf_file_object_type" do
    assert_difference('Gtf::FileObjectType.count') do
      post :create, gtf_file_object_type: {  }
    end

    assert_redirected_to gtf_file_object_type_path(assigns(:gtf_file_object_type))
  end

  test "should show gtf_file_object_type" do
    get :show, id: @gtf_file_object_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @gtf_file_object_type
    assert_response :success
  end

  test "should update gtf_file_object_type" do
    patch :update, id: @gtf_file_object_type, gtf_file_object_type: {  }
    assert_redirected_to gtf_file_object_type_path(assigns(:gtf_file_object_type))
  end

  test "should destroy gtf_file_object_type" do
    assert_difference('Gtf::FileObjectType.count', -1) do
      delete :destroy, id: @gtf_file_object_type
    end

    assert_redirected_to gtf_file_object_types_path
  end
end
