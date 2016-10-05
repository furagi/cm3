require 'test_helper'

class Gtf::ConfigurationsControllerTest < ActionController::TestCase
  setup do
    @gtf_configuration = gtf_configurations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gtf_configurations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gtf_configuration" do
    assert_difference('Gtf::Configuration.count') do
      post :create, gtf_configuration: {  }
    end

    assert_redirected_to gtf_configuration_path(assigns(:gtf_configuration))
  end

  test "should show gtf_configuration" do
    get :show, id: @gtf_configuration
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @gtf_configuration
    assert_response :success
  end

  test "should update gtf_configuration" do
    patch :update, id: @gtf_configuration, gtf_configuration: {  }
    assert_redirected_to gtf_configuration_path(assigns(:gtf_configuration))
  end

  test "should destroy gtf_configuration" do
    assert_difference('Gtf::Configuration.count', -1) do
      delete :destroy, id: @gtf_configuration
    end

    assert_redirected_to gtf_configurations_path
  end
end
