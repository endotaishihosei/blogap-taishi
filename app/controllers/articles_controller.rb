class ArticlesController < ApplicationController
  def index
    # @articles = Article.find(6)
    @articles = Article.all
  end

  def show
   @article = Article.find(params[:id])
  end
end