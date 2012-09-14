require 'test_helper'

class RakeFilesControllerTest < ActionController::TestCase
  setup do
    @rake_file = rake_files(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rake_files)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rake_file" do
    assert_difference('RakeFile.count') do
      post :create, rake_file: { active: @rake_file.active, fileName: @rake_file.fileName, path: @rake_file.path }
    end

    assert_redirected_to rake_file_path(assigns(:rake_file))
  end

  test "should show rake_file" do
    get :show, id: @rake_file
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rake_file
    assert_response :success
  end

  test "should update rake_file" do
    put :update, id: @rake_file, rake_file: { active: @rake_file.active, fileName: @rake_file.fileName, path: @rake_file.path }
    assert_redirected_to rake_file_path(assigns(:rake_file))
  end

  test "should destroy rake_file" do
    assert_difference('RakeFile.count', -1) do
      delete :destroy, id: @rake_file
    end

    assert_redirected_to rake_files_path
  end
end
