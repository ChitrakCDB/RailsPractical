class Api::V1::CommentsController < ApplicationController
    def index
      @comments = ApiComment.all
      render json: @comments
    end
  
    def show
      @comment = ApiComment.find(params[:id])
      render json: @comment
    end
  
    def create
      @comment = ApiComment.new(comment_params)
      if @comment.save
        render json: @comment
      else  
        render json: { error: 'Unable to create Comment'}, status: 400
      end
    end
  
    def update 
      @comment = ApiComment.find(params[:id])
      if @comment
        @comment.update(comment_params)
        render json: { message: 'Comment Successfully Updated!' }, status: 200
      else   
        render json: { error: 'Unable to update Comment'}, status: 400
      end
    end
  
    def destroy 
      @comment = ApiComment.find(params[:id])
      if @comment
        @comment.destroy
        render json: { message: 'Comment Successfully Deleted'}, status: 200
      else   
        render json: { error: 'Unable to delete Comment'}, status: 400
      end
    end
  
    def search
      @comment = ApiComment.where(content: params[:content])
      if params[:content]
        if @comment != []
          render json: @comment
        else   
          render json: { error: "Unable to find Comment!"}, status:400
        end
      else
        render json: { error: "Please provide something" }
      end  
    end
  
    private
    def comment_params
      params.require(:api_comment).permit(:content,:date_of_comment,:article_id)
    end    
  end
  