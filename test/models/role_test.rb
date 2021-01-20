require 'test_helper'

class RoleTest < ActiveSupport::TestCase
  test 'should have three roles' do
    @roles = Role.all
    assert_equal 3, @roles.size
  end

  test 'admin role has Admin name' do
    @role = roles(:role_admin)
    assert_equal 'Admin', @role.name
  end

  test 'editor role has Editor name' do
    @role = roles(:role_editor)
    assert_equal 'Editor', @role.name
  end

  test 'user role has User name' do
    @role = roles(:role_user)
    assert_equal 'User', @role.name
  end
end
