class SavedVideosController < ApplicationController
  def create
    saved_video = SavedVideo.new(saved_video_params)
    if saved_video.save
      render json: saved_video
    end
  end

  def destroy
    saved_video = SavedVideo.find(params[:id])
    if saved_video
      saved_video.destroy
    end
  end

  private

  def saved_video_params
    params.require(:saved_video).permit(:user_id, :video_id)
  end
end
