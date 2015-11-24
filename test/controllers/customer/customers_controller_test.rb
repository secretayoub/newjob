require 'test_helper'

class Customer::CustomersControllerTest < ActionController::TestCase
  setup do
    @customer_customer = customer_customers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:customer_customers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create customer_customer" do
    assert_difference('Customer::Customer.count') do
      post :create, customer_customer: {  }
    end

    assert_redirected_to customer_customer_path(assigns(:customer_customer))
  end

  test "should show customer_customer" do
    get :show, id: @customer_customer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @customer_customer
    assert_response :success
  end

  test "should update customer_customer" do
    patch :update, id: @customer_customer, customer_customer: {  }
    assert_redirected_to customer_customer_path(assigns(:customer_customer))
  end

  test "should destroy customer_customer" do
    assert_difference('Customer::Customer.count', -1) do
      delete :destroy, id: @customer_customer
    end

    assert_redirected_to customer_customers_path
  end
end
