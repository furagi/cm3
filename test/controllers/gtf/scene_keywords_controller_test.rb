require 'test_helper'

class Gtf::SceneKeywordsControllerTest < ActionController::TestCase
  setup do
    @gtf_scene_keyword = gtf_scene_keywords(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gtf_scene_keywords)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gtf_scene_keyword" do
    assert_difference('Gtf::SceneKeyword.count') do
      post :create, gtf_scene_keyword: {  }
    end

    assert_redirected_to gtf_scene_keyword_path(assigns(:gtf_scene_keyword))
  end

  test "should show gtf_scene_keyword" do
    get :show, id: @gtf_scene_keyword
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @gtf_scene_keyword
    assert_response :success
  end

  test "should update gtf_scene_keyword" do
    patch :update, id: @gtf_scene_keyword, gtf_scene_keyword: {  }
    assert_redirected_to gtf_scene_keyword_path(assigns(:gtf_scene_keyword))
  end

  test "should destroy gtf_scene_keyword" do
    assert_difference('Gtf::SceneKeyword.count', -1) do
      delete :destroy, id: @gtf_scene_keyword
    end

    assert_redirected_to gtf_scene_keywords_path
  end
end
