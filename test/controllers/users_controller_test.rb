require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    get '/users/sign_in'
    sign_in users(:user_admin)
    @user = users(:user_admin)
  end

  test 'should get index' do
    get users_url
    assert_response :success
  end

  test 'should get new' do
    get new_user_url
    assert_response :success
  end

  test 'should create user' do
    post users_url, params: { user: { name: @user.name, role_id: @user.role_id } }
    assert_response :success
  end

  test 'should show user' do
    get user_url(@user)
    assert_response :success
  end

  test 'should get edit' do
    get edit_user_url(@user)
    assert_response :success
  end

  test 'should update user' do
    patch user_url(@user), params: { user: { name: @user.name, role_id: @user.role_id } }
    assert_redirected_to user_url(@user)
  end

  test 'admin user can\'t destroy user' do
    delete user_url(@user)
    assert_response 302
  end

  test 'editor user can\'t create user' do
    sign_in users(:user_editor)
    post users_url, params: { user: { name: @user.name, role_id: @user.role_id } }
    assert_response 302
  end

  test 'editor user can\'t update user' do
    sign_in users(:user_editor)
    user = users(:user_user)
    patch user_url(user), params: { user: { name: user.name, role_id: user.role_id } }
    assert_response 302
  end

  test 'editor user can\'t show user' do
    sign_in users(:user_editor)
    get user_url(@user)
    assert_response 302
  end
end
