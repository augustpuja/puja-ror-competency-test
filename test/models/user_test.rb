require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'should have three users' do
    users = User.all
    assert_equal 3, users.size
  end

  test 'editor user should have editor role' do
    user = users(:user_editor)
    assert_equal 'Editor', user.role.name
  end

  test 'admin user should have admin role' do
    user = users(:user_admin)
    assert_equal true, user.admin?
  end

  test 'vanila user should have user role' do
    user = users(:user_user)
    assert_equal true, user.vanila_user?
  end

  test 'article with valid attributes' do
    role = roles(:role_editor)
    user = User.create(
      {
        name: 'User',
        email: 'user@example.com',
        password: 'password',
        password_confirmation: 'password',
        role: role
      }
    )
    assert user.valid?
  end

  test 'name must be present' do
    role = roles(:role_editor)
    user = User.create(
      {
        name: '',
        email: 'user@example.com',
        password: 'password',
        password_confirmation: 'password',
        role: role
      }
    )
    assert_includes user.errors.messages[:name], 'can\'t be blank'
  end
end
