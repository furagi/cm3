require 'test_helper'

class Shared::CountriesControllerTest < ActionController::TestCase
  setup do
    @shared_country = shared_countries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:shared_countries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create shared_country" do
    assert_difference('Shared::Country.count') do
      post :create, shared_country: {  }
    end

    assert_redirected_to shared_country_path(assigns(:shared_country))
  end

  test "should show shared_country" do
    get :show, id: @shared_country
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @shared_country
    assert_response :success
  end

  test "should update shared_country" do
    patch :update, id: @shared_country, shared_country: {  }
    assert_redirected_to shared_country_path(assigns(:shared_country))
  end

  test "should destroy shared_country" do
    assert_difference('Shared::Country.count', -1) do
      delete :destroy, id: @shared_country
    end

    assert_redirected_to shared_countries_path
  end
end
