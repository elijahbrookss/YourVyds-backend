class SubscriberSerializer
  def initialize(user_obj)
    @user = user_obj
  end

  def serialize
    object = {
      subscribers: @user.get_subscribers,
      subscriptions: @user.get_subscriptions
    }
    object.to_json({include: {videos: {include: [:user, :likes, :dislikes]}}})
  end
end
