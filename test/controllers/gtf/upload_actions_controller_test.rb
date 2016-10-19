require 'test_helper'

class Gtf::UploadActionsControllerTest < ActionController::TestCase
  setup do
    @gtf_upload_action = gtf_upload_actions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gtf_upload_actions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gtf_upload_action" do
    assert_difference('Gtf::UploadAction.count') do
      post :create, gtf_upload_action: {  }
    end

    assert_redirected_to gtf_upload_action_path(assigns(:gtf_upload_action))
  end

  test "should show gtf_upload_action" do
    get :show, id: @gtf_upload_action
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @gtf_upload_action
    assert_response :success
  end

  test "should update gtf_upload_action" do
    patch :update, id: @gtf_upload_action, gtf_upload_action: {  }
    assert_redirected_to gtf_upload_action_path(assigns(:gtf_upload_action))
  end

  test "should destroy gtf_upload_action" do
    assert_difference('Gtf::UploadAction.count', -1) do
      delete :destroy, id: @gtf_upload_action
    end

    assert_redirected_to gtf_upload_actions_path
  end
end
