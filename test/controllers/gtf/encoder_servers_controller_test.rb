require 'test_helper'

class Gtf::EncoderServersControllerTest < ActionController::TestCase
  setup do
    @gtf_encoder_server = gtf_encoder_servers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gtf_encoder_servers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gtf_encoder_server" do
    assert_difference('Gtf::EncoderServer.count') do
      post :create, gtf_encoder_server: {  }
    end

    assert_redirected_to gtf_encoder_server_path(assigns(:gtf_encoder_server))
  end

  test "should show gtf_encoder_server" do
    get :show, id: @gtf_encoder_server
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @gtf_encoder_server
    assert_response :success
  end

  test "should update gtf_encoder_server" do
    patch :update, id: @gtf_encoder_server, gtf_encoder_server: {  }
    assert_redirected_to gtf_encoder_server_path(assigns(:gtf_encoder_server))
  end

  test "should destroy gtf_encoder_server" do
    assert_difference('Gtf::EncoderServer.count', -1) do
      delete :destroy, id: @gtf_encoder_server
    end

    assert_redirected_to gtf_encoder_servers_path
  end
end
