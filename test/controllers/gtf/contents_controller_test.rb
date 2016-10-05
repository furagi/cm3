require 'test_helper'

class Gtf::ContentsControllerTest < ActionController::TestCase
  setup do
    @gtf_content = gtf_contents(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gtf_contents)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gtf_content" do
    assert_difference('Gtf::Content.count') do
      post :create, gtf_content: {  }
    end

    assert_redirected_to gtf_content_path(assigns(:gtf_content))
  end

  test "should show gtf_content" do
    get :show, id: @gtf_content
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @gtf_content
    assert_response :success
  end

  test "should update gtf_content" do
    patch :update, id: @gtf_content, gtf_content: {  }
    assert_redirected_to gtf_content_path(assigns(:gtf_content))
  end

  test "should destroy gtf_content" do
    assert_difference('Gtf::Content.count', -1) do
      delete :destroy, id: @gtf_content
    end

    assert_redirected_to gtf_contents_path
  end
end
