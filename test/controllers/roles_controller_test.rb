require 'test_helper'

class RolesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    get '/users/sign_in'
    sign_in users(:user_admin)
    @role = roles(:role_user)
  end

  test 'no one can get index action of role' do
    get roles_url
    assert_response 302
  end

  test 'no one can get new role' do
    get new_role_url
    assert_response 302
  end

  test 'no one can create role' do
    post roles_url, params: { role: { description: @role.description, name: @role.name } }
    assert_response 302
  end

  test 'no one can show role' do
    get role_url(@role)
    assert_response 302
  end

  test 'no one can edit role' do
    get edit_role_url(@role)
    assert_response 302
  end

  test 'no one can update role' do
    patch role_url(@role), params: { role: { description: @role.description, name: @role.name } }
    assert_response 302
  end

  test 'no one can destroy role' do
    delete role_url(@role)
    assert_response 302
  end
end
