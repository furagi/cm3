require 'test_helper'

class Gtf::SceneGenresControllerTest < ActionController::TestCase
  setup do
    @gtf_scene_genre = gtf_scene_genres(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gtf_scene_genres)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gtf_scene_genre" do
    assert_difference('Gtf::SceneGenre.count') do
      post :create, gtf_scene_genre: {  }
    end

    assert_redirected_to gtf_scene_genre_path(assigns(:gtf_scene_genre))
  end

  test "should show gtf_scene_genre" do
    get :show, id: @gtf_scene_genre
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @gtf_scene_genre
    assert_response :success
  end

  test "should update gtf_scene_genre" do
    patch :update, id: @gtf_scene_genre, gtf_scene_genre: {  }
    assert_redirected_to gtf_scene_genre_path(assigns(:gtf_scene_genre))
  end

  test "should destroy gtf_scene_genre" do
    assert_difference('Gtf::SceneGenre.count', -1) do
      delete :destroy, id: @gtf_scene_genre
    end

    assert_redirected_to gtf_scene_genres_path
  end
end
