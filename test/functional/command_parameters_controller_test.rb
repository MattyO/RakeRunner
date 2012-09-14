require 'test_helper'

class CommandParametersControllerTest < ActionController::TestCase
  setup do
    @command_parameter = command_parameters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:command_parameters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create command_parameter" do
    assert_difference('CommandParameter.count') do
      post :create, command_parameter: { name: @command_parameter.name, type: @command_parameter.type }
    end

    assert_redirected_to command_parameter_path(assigns(:command_parameter))
  end

  test "should show command_parameter" do
    get :show, id: @command_parameter
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @command_parameter
    assert_response :success
  end

  test "should update command_parameter" do
    put :update, id: @command_parameter, command_parameter: { name: @command_parameter.name, type: @command_parameter.type }
    assert_redirected_to command_parameter_path(assigns(:command_parameter))
  end

  test "should destroy command_parameter" do
    assert_difference('CommandParameter.count', -1) do
      delete :destroy, id: @command_parameter
    end

    assert_redirected_to command_parameters_path
  end
end
