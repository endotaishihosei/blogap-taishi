class CommentsController < ApplicationController
  def new
    article = Article.find(params[:article_id])
    # コメントを投稿するために「@comment」からの箱を用意する
    @comment = article.comments.build
  end

  def create
    article = Article.find(params[:article_id])
    @comment = article.comments.build(comment_params)
    if @comment.save
      redirect_to article_path(article), notice: 'コメントを追加'
    else
      flash.now[:error] = '更新できませんでした'
      render :new
    end
  end

  private
  def comment_params
    # Strong Parameter
    params.require(:comment).permit(:content)
  end
end