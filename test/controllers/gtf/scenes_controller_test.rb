require 'test_helper'

class Gtf::ScenesControllerTest < ActionController::TestCase
  setup do
    @gtf_scene = gtf_scenes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gtf_scenes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gtf_scene" do
    assert_difference('Gtf::Scene.count') do
      post :create, gtf_scene: {  }
    end

    assert_redirected_to gtf_scene_path(assigns(:gtf_scene))
  end

  test "should show gtf_scene" do
    get :show, id: @gtf_scene
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @gtf_scene
    assert_response :success
  end

  test "should update gtf_scene" do
    patch :update, id: @gtf_scene, gtf_scene: {  }
    assert_redirected_to gtf_scene_path(assigns(:gtf_scene))
  end

  test "should destroy gtf_scene" do
    assert_difference('Gtf::Scene.count', -1) do
      delete :destroy, id: @gtf_scene
    end

    assert_redirected_to gtf_scenes_path
  end
end
