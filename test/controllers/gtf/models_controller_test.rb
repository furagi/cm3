require 'test_helper'

class Gtf::ModelsControllerTest < ActionController::TestCase
  setup do
    @gtf_model = gtf_models(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gtf_models)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gtf_model" do
    assert_difference('Gtf::Model.count') do
      post :create, gtf_model: {  }
    end

    assert_redirected_to gtf_model_path(assigns(:gtf_model))
  end

  test "should show gtf_model" do
    get :show, id: @gtf_model
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @gtf_model
    assert_response :success
  end

  test "should update gtf_model" do
    patch :update, id: @gtf_model, gtf_model: {  }
    assert_redirected_to gtf_model_path(assigns(:gtf_model))
  end

  test "should destroy gtf_model" do
    assert_difference('Gtf::Model.count', -1) do
      delete :destroy, id: @gtf_model
    end

    assert_redirected_to gtf_models_path
  end
end
