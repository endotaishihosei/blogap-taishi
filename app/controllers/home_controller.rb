class HomeController < ApplicationController
  def index
    @article = Article.find(6)
  end

  def about
  end
end