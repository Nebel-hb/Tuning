class Public::CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event, only: [:index, :create]

  def index
     @comments = Comment.all
     @comment = Comment.new
  end

  def create
    comment = Comment.new(comment_params)
    if comment.save
      redirect_to event_path(@event)
    else
      flash[:notice] = "コメントを入力して下さい"
      redirect_to event_path(@event)
    end
  end

  def destroy
    Comment.find_by(id: params[:id]).destroy
    redirect_to event_path(params[:event_id])
  end

  private
  def comment_params
    params.require(:comment).permit(:comment, :user_id, :event_id)
  end

  def set_event
    @event = Event.find(params[:event_id])
  end
end
