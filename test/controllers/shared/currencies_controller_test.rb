require 'test_helper'

class Shared::CurrenciesControllerTest < ActionController::TestCase
  setup do
    @shared_currency = shared_currencies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:shared_currencies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create shared_currency" do
    assert_difference('Shared::Currency.count') do
      post :create, shared_currency: {  }
    end

    assert_redirected_to shared_currency_path(assigns(:shared_currency))
  end

  test "should show shared_currency" do
    get :show, id: @shared_currency
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @shared_currency
    assert_response :success
  end

  test "should update shared_currency" do
    patch :update, id: @shared_currency, shared_currency: {  }
    assert_redirected_to shared_currency_path(assigns(:shared_currency))
  end

  test "should destroy shared_currency" do
    assert_difference('Shared::Currency.count', -1) do
      delete :destroy, id: @shared_currency
    end

    assert_redirected_to shared_currencies_path
  end
end
