class CommentsController < ApplicationController

  def new
    @event = Event.find(params[:event_id])
    @comment = Comment.new
  end
                                                                                                                                                                       
  def create
    @event = Event.find(params[:event_id])
    @comment = Comment.create(comment_params)
    if @comment.valid?
      flash[:errors] = "Successfully Created Comment"
      redirect_to event_path(@event)
    else  
      flash[:errors] = @comment.errors.full_messages
      redirect_to new_comment_path
    end
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def edit
    @event = Event.find(params[:event_id])
    @comment = Comment.find(params[:id])
  end

  def update
    @event = Event.find(params[:event_id])
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      flash[:errors] = "Successfully Updated Comment"
      redirect_to event_path(@event)
    else  
      flash[:errors] = @comment.errors.full_messages
      redirect_to edit_event_comment_path
    end
  end

  def destroy
    @event = Event.find(params[:event_id])
    @comment = Comment.find(params[:id])
    if @comment.destroy
      flash[:errors] = "Successfully Deleted Comment"
      redirect_to event_path(@event)
    else  
      flash[:errors] = @comment.errors.full_messages
      redirect_to new_comment_path
    end
  end
  
  def like
    @comment = Comment.find_by(id: params[:comment_id].to_i)
    @comment.likes = @comment.likes.to_i + 1
    @comment.update(likes: @comment.likes)
    @event = Event.find(params[:event_id])
    redirect_to event_path(@event)
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :myuser_id, :event_id)
  end
    
end
