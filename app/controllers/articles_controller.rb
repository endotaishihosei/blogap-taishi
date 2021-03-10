class ArticlesController < ApplicationController
  def index
    # @articles = Article.find(6)
    @articles = Article.all
  end
end