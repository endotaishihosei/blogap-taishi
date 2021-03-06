class ArticlesController < ApplicationController
  before_action :set_article, only: [:show]
  before_action :authenticate_user!, only: [:new, :create, :edit, :destroy]

  def index
    # @articles = Article.find(6)
    @articles = Article.all
  end

  def show
    @comments = @article.comments
  end

  def new
    # @article = Article.new
    # userと紐づけるための変更
    @article = current_user.articles.build
    # current_user => サインインしているユーザを取得するdeviseヘルパーメソッド
  end

  def create
    # @article = Article.new(article_params)
    @article = current_user.articles.build(article_params)
    if @article.save
      redirect_to article_path(@article), notice: '保存できたよ'
    else
      flash.now[:error] = '保存に失敗しました'
      render :new
    end
  end

  def edit
    @article = current_user.articles.find(params[:id])
    # articlesと複数形 => modelsでhas_manyとしているため
  end

  def update
    @article = current_user.articles.find(params[:id])
    if @article.update(article_params)
      redirect_to article_path(@article), notice: '更新できました'
    else
      flash.now[:error] = '更新できませんでした'
      render :edit
    end
  end

  def destroy
    # article = Article.find(params[:id])
    article = current_user.articles.find(params[:id])
    article.destroy!
    redirect_to root_path, notice: '削除に成功しました'
  end

  private
  def article_params
    params.require(:article).permit(:title, :content, :eyecatch)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end