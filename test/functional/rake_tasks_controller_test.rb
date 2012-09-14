require 'test_helper'

class RakeTasksControllerTest < ActionController::TestCase
  setup do
    @rake_task = rake_tasks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rake_tasks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rake_task" do
    assert_difference('RakeTask.count') do
      post :create, rake_task: { active: @rake_task.active, task: @rake_task.task }
    end

    assert_redirected_to rake_task_path(assigns(:rake_task))
  end

  test "should show rake_task" do
    get :show, id: @rake_task
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rake_task
    assert_response :success
  end

  test "should update rake_task" do
    put :update, id: @rake_task, rake_task: { active: @rake_task.active, task: @rake_task.task }
    assert_redirected_to rake_task_path(assigns(:rake_task))
  end

  test "should destroy rake_task" do
    assert_difference('RakeTask.count', -1) do
      delete :destroy, id: @rake_task
    end

    assert_redirected_to rake_tasks_path
  end
end
