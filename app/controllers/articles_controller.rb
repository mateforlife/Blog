class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:show,:index]
  before_action :set_article, except: [:index,:new,:create]
  #GET articles
  def index
    @articles = Article.all
  end
  
  def show
    @article.update_visits_count
    @comment = Comment.new
  end

  def new
    @article = Article.new
    @categories = Category.all
  end 

  #POST /articles
  def create
    #@article = Article.new(title: params[:article][:title], body: params[:article][:body])
    @article = current_user.articles.new(article_params) 
    @article.categories = params[:categories]                    
    if @article.save
      redirect_to @article  
    else
      render :new
    end           
  end

  def edit
  end  

  #delete "/articles/:id"
  def destroy
    @article.destroy
    redirect_to articles_path
  end  

  #PUT /articles/:id
  def update
    @article.update(article_params)
    if @article.save
      redirect_to @article  
    else
      render :edit
    end 
  end  

  def set_article 
    @article = Article.find(params[:id])
  end  

  private
    def article_params
      params.require(:article).permit(:title,:body,:cover,:categories)
    end

    def validate_user 
      redirect_to new_user_session_path, notice: "Debes iniciar sesión para continuar"
    end
    
end
