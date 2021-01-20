require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  test 'article with valid attributes' do
    @user = users(:user_editor)
    article = Article.new(title: 'test', category: 'Category A', user: @user)
    assert article.valid?
  end

  test 'title must be present' do
    article = Article.new(title: '')
    article.valid?
    assert_includes article.errors.messages[:title], 'can\'t be blank'
  end

  test 'category must be present' do
    article = Article.new(category: '')
    article.valid?
    assert_includes article.errors.messages[:category], 'can\'t be blank'
  end

  test 'user must be present' do
    article = Article.new(title: 'test', category: 'Category A')
    article.valid?
    assert_includes article.errors.messages[:user], 'must exist'
  end
end
