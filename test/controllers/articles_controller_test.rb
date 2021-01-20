require 'test_helper'

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    get '/users/sign_in'
    sign_in users(:user_admin)
    @article = articles(:two)
  end

  test 'should get index' do
    get articles_url
    assert_response :success
  end

  test 'admin user can\'t get new' do
    get new_article_url
    assert_response 302
  end

  test 'admin user can\'t create article' do
    post articles_url, params:
    {
      article:
      {
        category: @article.category,
        content: @article.content,
        title: @article.title,
        user_id: @article.user_id
      }
    }
    assert_response 302
  end

  test 'should show article' do
    get article_url(@article)
    assert_response :success
  end

  test 'admin user can\'t edit article' do
    get edit_article_url(@article)
    assert_response 302
  end

  test 'admin user can\'t update article' do
    patch article_url(@article), params:
    {
      article:
      {
        category: @article.category,
        content: @article.content,
        title: @article.title,
        user_id: @article.user_id
      }
    }
    assert_response 302
  end

  test 'admin user can\'t destroy article' do
    delete article_url(@article)
    assert_response 302
  end

  test 'editor user can show all article' do
    sign_in users(:user_editor)
    get article_url(@article)
    assert_response :success
  end

  test 'editor user can create article' do
    sign_in users(:user_editor)
    post articles_url, params:
    {
      article:
        {
          category: @article.category,
          content: @article.content,
          title: @article.title,
          user_id: @article.user_id
        }
    }
    assert_response :success
  end

  test 'editor user can update his own article' do
    sign_in users(:user_editor)
    patch article_url(@article), params:
    {
      article:
        {
          category: @article.category,
          content: @article.content,
          title: @article.title,
          user_id: @article.user_id
        }
    }
    assert_response :success
  end
end
