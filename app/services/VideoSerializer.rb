class VideoSerializer
  def initialize(video_obj)
    @video = video_obj
  end

  def serialize
    options = {
      include: {
        comments: {
          include: [:user]
        },
        user: {
          except: [:created_at, :updated_at]
        },
        likes: {
          except: [:created_at, :updated_at]
        },
        dislikes: {
          except: [:created_at, :updated_at]
        }
      }
    }

    @video.to_json(options)
  end



end
