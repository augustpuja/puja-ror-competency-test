class HomesController < ApplicationController
  def index
    @articles = Article.all.group_by(&:category)
  end
end
