require 'test_helper'

class HighfivesControllerTest < ActionController::TestCase
  setup do
    @highfife = highfives(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:highfives)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create highfife" do
    assert_difference('Highfive.count') do
      post :create, :highfife => @highfife.attributes
    end

    assert_redirected_to highfife_path(assigns(:highfife))
  end

  test "should show highfife" do
    get :show, :id => @highfife.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @highfife.to_param
    assert_response :success
  end

  test "should update highfife" do
    put :update, :id => @highfife.to_param, :highfife => @highfife.attributes
    assert_redirected_to highfife_path(assigns(:highfife))
  end

  test "should destroy highfife" do
    assert_difference('Highfive.count', -1) do
      delete :destroy, :id => @highfife.to_param
    end

    assert_redirected_to highfives_path
  end
end
