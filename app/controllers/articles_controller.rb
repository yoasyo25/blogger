class ArticlesController < ApplicationController
  before_action :find_article, only: [:show, :edit, :update, :delete]
  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(articles_params)

    if @article.save
      flash[:success] = "Article created"
      redirect_to article_path(article)
    else
      render new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @article.update(articles_params)
      flash[:success] = "Article Updated"
      redirect_to article_path(@article)
    else
      render edit
    end
  end

  def destroy
    Article.destroy(params[:id])
    flash[:danger] = "Article was deleted"
    redirect_to articles_path
  end

    private

      def articles_params
        params.require(:article).permit(:title, :body)
      end

      def find_article
        @article = Article.find(params[:id])
      end

end
