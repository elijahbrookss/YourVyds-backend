class VideosController < ApplicationController
  skip_before_action  :authorized, only: [:show, :index]
  def create
    video = Video.new()
    video.name = params[:name]
    video.description = params[:description]
    video.user = current_user
    if video.save

      begin
        imageFile = Cloudinary::Uploader.upload(
          params[:thumbnail],
          public_id: "thb-" + video.id.to_s)

        videoFile = Cloudinary::Uploader.upload(
          params[:video],
          resource_type: :video,
          public_id: "vid-" + video.id.to_s)

        video.thumbnail = imageFile['url']
        video.video = videoFile['url']
      rescue => e
        video.destroy
        render json: { error: "There was an error uploading video." }
      end
      if video.save
        render json: VideoSerializer.new(video).serialize
      end
    end
  end

  def index
    videos = Video.all
    render json: VideoSerializer.new(videos).serialize
  end

  def destroy
    video = Video.find(params[:id])
    Cloudinary::Uploader.destroy(
      'vid-' + video.id.to_s,
      resource_type: :video
    )
    Cloudinary::Uploader.destroy('thb-' + video.id.to_s)
    if video
      video.destroy
    end
  end

  def show
    video = Video.find(params[:id])
    if video
      render json: VideoSerializer.new(video).serialize
    else
      render json: {message: "Error..."}
    end
  end

  def update
    video = Video.find(params[:id])
    if video
      video.name = params[:name]
      video.description = params[:description]
      imageFile = Cloudinary::Uploader.upload(
        params[:thumbnail],
        public_id: "thb-" + video.id.to_s)
      videoFile = Cloudinary::Uploader.upload(
        params[:video],
        resource_type: :video,
        public_id: "vid-" + video.id.to_s
      )
      video.thumbnail = imageFile['url']
      video.video = videoFile['url']

      if video.save
        render json: VideoSerializer.new(video).serialize
      end
    end
  end

end
