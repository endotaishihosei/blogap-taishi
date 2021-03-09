class ArticlesController < ApplicationController
  def index
    @article = Article.find(6)
  end
end