require 'test_helper'

class Customer::AdsControllerTest < ActionController::TestCase
  setup do
    @customer_ad = customer_ads(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:customer_ads)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create customer_ad" do
    assert_difference('Customer::Ad.count') do
      post :create, customer_ad: {  }
    end

    assert_redirected_to customer_ad_path(assigns(:customer_ad))
  end

  test "should show customer_ad" do
    get :show, id: @customer_ad
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @customer_ad
    assert_response :success
  end

  test "should update customer_ad" do
    patch :update, id: @customer_ad, customer_ad: {  }
    assert_redirected_to customer_ad_path(assigns(:customer_ad))
  end

  test "should destroy customer_ad" do
    assert_difference('Customer::Ad.count', -1) do
      delete :destroy, id: @customer_ad
    end

    assert_redirected_to customer_ads_path
  end
end
