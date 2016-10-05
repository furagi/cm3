require 'test_helper'

class Gtf::DirectorsControllerTest < ActionController::TestCase
  setup do
    @gtf_director = gtf_directors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gtf_directors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gtf_director" do
    assert_difference('Gtf::Director.count') do
      post :create, gtf_director: {  }
    end

    assert_redirected_to gtf_director_path(assigns(:gtf_director))
  end

  test "should show gtf_director" do
    get :show, id: @gtf_director
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @gtf_director
    assert_response :success
  end

  test "should update gtf_director" do
    patch :update, id: @gtf_director, gtf_director: {  }
    assert_redirected_to gtf_director_path(assigns(:gtf_director))
  end

  test "should destroy gtf_director" do
    assert_difference('Gtf::Director.count', -1) do
      delete :destroy, id: @gtf_director
    end

    assert_redirected_to gtf_directors_path
  end
end
