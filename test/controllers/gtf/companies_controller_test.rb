require 'test_helper'

class Gtf::CompaniesControllerTest < ActionController::TestCase
  setup do
    @gtf_company = gtf_companies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gtf_companies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gtf_company" do
    assert_difference('Gtf::Company.count') do
      post :create, gtf_company: {  }
    end

    assert_redirected_to gtf_company_path(assigns(:gtf_company))
  end

  test "should show gtf_company" do
    get :show, id: @gtf_company
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @gtf_company
    assert_response :success
  end

  test "should update gtf_company" do
    patch :update, id: @gtf_company, gtf_company: {  }
    assert_redirected_to gtf_company_path(assigns(:gtf_company))
  end

  test "should destroy gtf_company" do
    assert_difference('Gtf::Company.count', -1) do
      delete :destroy, id: @gtf_company
    end

    assert_redirected_to gtf_companies_path
  end
end
