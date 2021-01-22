class VideosController < ApplicationController
  skip_before_action  :authorized, only: [:show, :index]
  def create
    video = Video.new()
    imageFile = Cloudinary::Uploader.upload(params[:thumbnail])
    videoFile = Cloudinary::Uploader.upload(params[:video], :resource_type => :video)

    video.name = params[:name]
    video.description = params[:description]
    video.thumbnail = imageFile['url']
    video.video = videoFile['url']

    video.user = current_user
    if video.save
      render json: VideoSerializer.new(video).serialize
    end
  end

  def index
    videos = Video.all
    render json: VideoSerializer.new(videos).serialize
  end

  def destroy
    video = Video.find(params[:id])
    if video
      video.destroy
    end
  end

  def show
    video = Video.find(params[:id])
    if video
      render json: VideoSerializer.new(video).serialize
    end
  end

  def update
    video = Video.find(params[:id])
    if video
      video.update(video_params)

      render json: VideoSerializer.new(video).serialize
    end
  end

  private

  def video_params
    params.require(:video).permit( :name, :video, :thumbnail, :description)
  end
end
