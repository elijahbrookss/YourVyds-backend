class UserSerializer
  def initialize(user_obj)
    @user = user_obj
  end

  def serialize
    options = {
      include: {
        videos: {
          include: [:comments, :user, :likes, :dislikes]
        },
        likes: {
          except: [:created_at, :updated_at]
        },
        dislikes: {
          except: [:created_at, :updated_at]
        },
        saved_videos: {
          except: [:created_at, :updated_at],
          include: {
            video: {
              include: [:user, :likes]
            }
          }
        }
      },
    }
    @user.to_json(options)
  end



end
