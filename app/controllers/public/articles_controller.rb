class Public::ArticlesController < ApplicationController
    
  def new
    @article = Article.new
  end
    
    # 投稿データの保存
  def create
    @article = Article.new(article_params)
    @article.customer_id = current_customer.id
    @article.save
    redirect_to articles_path
  end

  def index
    @article = Article.new
    @articles = Article.all
  end

  def show
  end

  def destroy
  end

  
   # 投稿データのストロングパラメータ
  private

  def article_params
    params.require(:article).permit(:image, :caption, :customer_id)
  end
    
end
