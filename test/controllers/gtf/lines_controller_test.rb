require 'test_helper'

class Gtf::LinesControllerTest < ActionController::TestCase
  setup do
    @gtf_line = gtf_lines(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gtf_lines)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gtf_line" do
    assert_difference('Gtf::Line.count') do
      post :create, gtf_line: {  }
    end

    assert_redirected_to gtf_line_path(assigns(:gtf_line))
  end

  test "should show gtf_line" do
    get :show, id: @gtf_line
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @gtf_line
    assert_response :success
  end

  test "should update gtf_line" do
    patch :update, id: @gtf_line, gtf_line: {  }
    assert_redirected_to gtf_line_path(assigns(:gtf_line))
  end

  test "should destroy gtf_line" do
    assert_difference('Gtf::Line.count', -1) do
      delete :destroy, id: @gtf_line
    end

    assert_redirected_to gtf_lines_path
  end
end
