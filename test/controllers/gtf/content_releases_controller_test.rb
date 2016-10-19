require 'test_helper'

class Gtf::ContentReleasesControllerTest < ActionController::TestCase
  setup do
    @gtf_content_release = gtf_content_releases(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gtf_content_releases)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gtf_content_release" do
    assert_difference('Gtf::ContentRelease.count') do
      post :create, gtf_content_release: {  }
    end

    assert_redirected_to gtf_content_release_path(assigns(:gtf_content_release))
  end

  test "should show gtf_content_release" do
    get :show, id: @gtf_content_release
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @gtf_content_release
    assert_response :success
  end

  test "should update gtf_content_release" do
    patch :update, id: @gtf_content_release, gtf_content_release: {  }
    assert_redirected_to gtf_content_release_path(assigns(:gtf_content_release))
  end

  test "should destroy gtf_content_release" do
    assert_difference('Gtf::ContentRelease.count', -1) do
      delete :destroy, id: @gtf_content_release
    end

    assert_redirected_to gtf_content_releases_path
  end
end
