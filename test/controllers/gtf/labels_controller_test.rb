require 'test_helper'

class Gtf::LabelsControllerTest < ActionController::TestCase
  setup do
    @gtf_label = gtf_labels(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gtf_labels)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gtf_label" do
    assert_difference('Gtf::Label.count') do
      post :create, gtf_label: {  }
    end

    assert_redirected_to gtf_label_path(assigns(:gtf_label))
  end

  test "should show gtf_label" do
    get :show, id: @gtf_label
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @gtf_label
    assert_response :success
  end

  test "should update gtf_label" do
    patch :update, id: @gtf_label, gtf_label: {  }
    assert_redirected_to gtf_label_path(assigns(:gtf_label))
  end

  test "should destroy gtf_label" do
    assert_difference('Gtf::Label.count', -1) do
      delete :destroy, id: @gtf_label
    end

    assert_redirected_to gtf_labels_path
  end
end
