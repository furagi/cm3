require 'test_helper'

class Gtf::FileObjectTypeFamiliesControllerTest < ActionController::TestCase
  setup do
    @gtf_file_object_type_family = gtf_file_object_type_families(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gtf_file_object_type_families)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gtf_file_object_type_family" do
    assert_difference('Gtf::FileObjectTypeFamily.count') do
      post :create, gtf_file_object_type_family: {  }
    end

    assert_redirected_to gtf_file_object_type_family_path(assigns(:gtf_file_object_type_family))
  end

  test "should show gtf_file_object_type_family" do
    get :show, id: @gtf_file_object_type_family
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @gtf_file_object_type_family
    assert_response :success
  end

  test "should update gtf_file_object_type_family" do
    patch :update, id: @gtf_file_object_type_family, gtf_file_object_type_family: {  }
    assert_redirected_to gtf_file_object_type_family_path(assigns(:gtf_file_object_type_family))
  end

  test "should destroy gtf_file_object_type_family" do
    assert_difference('Gtf::FileObjectTypeFamily.count', -1) do
      delete :destroy, id: @gtf_file_object_type_family
    end

    assert_redirected_to gtf_file_object_type_families_path
  end
end
