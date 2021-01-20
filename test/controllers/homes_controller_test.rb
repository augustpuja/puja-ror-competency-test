require 'test_helper'

class HomesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    get '/users/sign_in'
    sign_in users(:user_admin)
  end

  test 'should get index' do
    get homes_index_url
    assert_response :success
  end
end
