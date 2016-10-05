require 'test_helper'

class Gtf::ContentPriceRatesControllerTest < ActionController::TestCase
  setup do
    @gtf_content_price_rate = gtf_content_price_rates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gtf_content_price_rates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gtf_content_price_rate" do
    assert_difference('Gtf::ContentPriceRate.count') do
      post :create, gtf_content_price_rate: {  }
    end

    assert_redirected_to gtf_content_price_rate_path(assigns(:gtf_content_price_rate))
  end

  test "should show gtf_content_price_rate" do
    get :show, id: @gtf_content_price_rate
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @gtf_content_price_rate
    assert_response :success
  end

  test "should update gtf_content_price_rate" do
    patch :update, id: @gtf_content_price_rate, gtf_content_price_rate: {  }
    assert_redirected_to gtf_content_price_rate_path(assigns(:gtf_content_price_rate))
  end

  test "should destroy gtf_content_price_rate" do
    assert_difference('Gtf::ContentPriceRate.count', -1) do
      delete :destroy, id: @gtf_content_price_rate
    end

    assert_redirected_to gtf_content_price_rates_path
  end
end
