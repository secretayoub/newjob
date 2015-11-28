require 'test_helper'

class Customer::MessagesControllerTest < ActionController::TestCase
  setup do
    @customer_message = customer_messages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:customer_messages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create customer_message" do
    assert_difference('Customer::Message.count') do
      post :create, customer_message: {  }
    end

    assert_redirected_to customer_message_path(assigns(:customer_message))
  end

  test "should show customer_message" do
    get :show, id: @customer_message
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @customer_message
    assert_response :success
  end

  test "should update customer_message" do
    patch :update, id: @customer_message, customer_message: {  }
    assert_redirected_to customer_message_path(assigns(:customer_message))
  end

  test "should destroy customer_message" do
    assert_difference('Customer::Message.count', -1) do
      delete :destroy, id: @customer_message
    end

    assert_redirected_to customer_messages_path
  end
end
