require 'test_helper'

class TeammembersControllerTest < ActionController::TestCase
  setup do
    @teammember = teammembers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:teammembers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create teammember" do
    assert_difference('Teammember.count') do
      post :create, teammember: { display_name: @teammember.display_name, name: @teammember.name }
    end

    assert_redirected_to teammember_path(assigns(:teammember))
  end

  test "should show teammember" do
    get :show, id: @teammember
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @teammember
    assert_response :success
  end

  test "should update teammember" do
    patch :update, id: @teammember, teammember: { display_name: @teammember.display_name, name: @teammember.name }
    assert_redirected_to teammember_path(assigns(:teammember))
  end

  test "should destroy teammember" do
    assert_difference('Teammember.count', -1) do
      delete :destroy, id: @teammember
    end

    assert_redirected_to teammembers_path
  end
end
