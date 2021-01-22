class DislikesController < ApplicationController
  def create
    dislike = Dislike.new(dislike_params)
    if dislike.save
      render json: dislike
    end
  end

  def destroy
    dislike = Dislike.find(params[:id])
    if dislike
      dislike.destroy
    end

  end


  private

  def dislike_params
    params.require(:dislike).permit(:user_id, :video_id)
  end
end
