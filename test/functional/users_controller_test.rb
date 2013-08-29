require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:admin)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    @new_user = User.new(@user.attributes.except("id","created_at","updated_at"))
    @new_user.email = "functional@test.com"
    @new_user.nick = "novonick"
    assert_difference('User.count') do
      post :create, user: { admin: @new_user.admin, born_at: @new_user.born_at, email: @new_user.email, hobby: @new_user.hobby, name: @new_user.name, nick: @new_user.nick, password: @new_user.password, situation: @new_user.situation }
    end
    assert_redirected_to user_path(assigns(:user))
  end

  test "should show user" do
    get :show, id: @user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user
    assert_response :success
  end

  test "should update user" do
    put :update, id: @user, user: { admin: @user.admin, born_at: @user.born_at, email: @user.email, hobby: @user.hobby, name: @user.name, nick: @user.nick, password: @user.password, situation: @user.situation }
    assert_redirected_to user_path(assigns(:user))
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_path
  end
end
