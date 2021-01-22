class CommentsController < ApplicationController

  def create
    comment = Comment.new(comment_params)
    if comment.save
      render json: comment, include: [:user]
    end
  end

  def update
    comment = Comment.find(params[:id])
    if comment
      comment.update(comment_params)
      render json: comment, include: [:user]
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    if comment
      comment.destroy
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :user_id, :video_id)
  end
end
