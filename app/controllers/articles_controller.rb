class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_article, only: [:show, :update, :edit, :destroy]
  before_action :check_owner, only: [:edit, :update, :destroy]
  
  def new
    @article = Article.new
  end
  
  def create
    @article = Article.new(article_params)
    @article.user = current_user
    if @article.save
      redirect_to article_url(@article)
    else
      render 'new'
    end
  end

  def show
    
  end
  
  def index
    @articles = Article.page(params[:page]).per(10).order(created_at: :desc)
  end
  
  def edit
    
  end
  
  def update
    if @article.update(article_params) && @article.user == current_user
      redirect_to article_url
    else
      render 'edit'
    end
  
  end
  
  def destroy
    if @article.destroy
      redirect_to articles_url
    else
      redirect_back fallback_location: article_url(@article)
      #뒤로 가는데, 만약 실패하면 article_url로 가라
    end
  end
  
  private
  def set_article
    @article = Article.find(params[:id])
  end
  
  def article_params
    params.require(:article).permit(:title, :content)
  end
  
  def check_owner
    redirect_back fallback_location: root_url if @article.user != current_user
  end
end
