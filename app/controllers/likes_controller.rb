class LikesController < ApplicationController

  def create
    like = Like.new(like_params)
    if like.save
      render json: like
    end
  end

  def destroy
    like = Like.find(params[:id])
    if like
      like.destroy
    end

  end


  private

  def like_params
    params.require(:like).permit(:user_id, :video_id)
  end
end
