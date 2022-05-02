class Api::V1::ArticlesController < ApplicationController
    def index
      @articles = Article.all
      render json: @articles
    end
  
    def show
      @article = Article.find(params[:id])
      render json: @article
    end
  
    def create
      @article = Article.new(article_params)
      if @article.save
        render json: @article
      else  
        render json: { error: 'Unable to create Article'}, status: 400
      end
    end
  
    def update 
      @article = Article.find(params[:id])
      if @article
        @article.update(article_params)
        render json: { message: 'Article Successfully Updated!' }, status: 200
      else   
        render json: { error: 'Unable to update Article'}, status: 400
      end
    end
  
    def destroy 
      @article = Article.find(params[:id])
      if @article
        @article.destroy
        render json: { message: 'Article Successfully Deleted'}, status: 200
      else   
        render json: 'Unable to delete Article'
      end
    end
  
    def search
      @article = Article.where(title: params[:title])
      if params[:title]
        if @article != []
          render json: @article
        else   
          render json: { error: "Unable to find Article!"}, status:400
        end
      else
        render json: { error: "Please Provide Something!"}, status:400
      end
      
    end
  
    private
    def article_params
      params.require(:article).permit(:title,:body,:release_date)
    end
  
  end
  