require 'test_helper'

class CandidatsControllerTest < ActionController::TestCase
  setup do
    @candidat = candidats(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:candidats)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create candidat" do
    assert_difference('Candidat.count') do
      post :create, candidat: {  }
    end

    assert_redirected_to candidat_path(assigns(:candidat))
  end

  test "should show candidat" do
    get :show, id: @candidat
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @candidat
    assert_response :success
  end

  test "should update candidat" do
    patch :update, id: @candidat, candidat: {  }
    assert_redirected_to candidat_path(assigns(:candidat))
  end

  test "should destroy candidat" do
    assert_difference('Candidat.count', -1) do
      delete :destroy, id: @candidat
    end

    assert_redirected_to candidats_path
  end
end
