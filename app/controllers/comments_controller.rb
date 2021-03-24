class CommentsController < ApplicationController
  def new
    article = Article.find(params[:article_id])
    # コメントを投稿するために「@comment」からの箱を用意する
    @comment = article.comments.build
  end
end