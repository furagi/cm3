require 'test_helper'

class Gtf::AgentsControllerTest < ActionController::TestCase
  setup do
    @gtf_agent = gtf_agents(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gtf_agents)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gtf_agent" do
    assert_difference('Gtf::Agent.count') do
      post :create, gtf_agent: {  }
    end

    assert_redirected_to gtf_agent_path(assigns(:gtf_agent))
  end

  test "should show gtf_agent" do
    get :show, id: @gtf_agent
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @gtf_agent
    assert_response :success
  end

  test "should update gtf_agent" do
    patch :update, id: @gtf_agent, gtf_agent: {  }
    assert_redirected_to gtf_agent_path(assigns(:gtf_agent))
  end

  test "should destroy gtf_agent" do
    assert_difference('Gtf::Agent.count', -1) do
      delete :destroy, id: @gtf_agent
    end

    assert_redirected_to gtf_agents_path
  end
end
