require 'test_helper'

class TasklinesControllerTest < ActionController::TestCase
  setup do
    @taskline = tasklines(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tasklines)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create taskline" do
    assert_difference('Taskline.count') do
      post :create, taskline: { actual_end_dt: @taskline.actual_end_dt, actual_manhours: @taskline.actual_manhours, actual_start_dt: @taskline.actual_start_dt, code: @taskline.code, completion: @taskline.completion, desc: @taskline.desc, display_seq: @taskline.display_seq, name: @taskline.name, planned_end_dt: @taskline.planned_end_dt, planned_manhours: @taskline.planned_manhours, planned_start_dt: @taskline.planned_start_dt, project_id: @taskline.project_id, teammember_id: @taskline.teammember_id, uplevel_id: @taskline.uplevel_id }
    end

    assert_redirected_to taskline_path(assigns(:taskline))
  end

  test "should show taskline" do
    get :show, id: @taskline
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @taskline
    assert_response :success
  end

  test "should update taskline" do
    patch :update, id: @taskline, taskline: { actual_end_dt: @taskline.actual_end_dt, actual_manhours: @taskline.actual_manhours, actual_start_dt: @taskline.actual_start_dt, code: @taskline.code, completion: @taskline.completion, desc: @taskline.desc, display_seq: @taskline.display_seq, name: @taskline.name, planned_end_dt: @taskline.planned_end_dt, planned_manhours: @taskline.planned_manhours, planned_start_dt: @taskline.planned_start_dt, project_id: @taskline.project_id, teammember_id: @taskline.teammember_id, uplevel_id: @taskline.uplevel_id }
    assert_redirected_to taskline_path(assigns(:taskline))
  end

  test "should destroy taskline" do
    assert_difference('Taskline.count', -1) do
      delete :destroy, id: @taskline
    end

    assert_redirected_to tasklines_path
  end
end
