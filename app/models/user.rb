class User < ApplicationRecord
  has_secure_password
  has_many :comments, dependent: :destroy
  has_many :videos, dependent: :destroy
  has_many :subscriptions, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :dislikes, dependent: :destroy
  has_many :saved_videos, dependent: :destroy

  attribute :banner_picture, default: "https://www.acurax.com/wp-content/themes/acuraxsite/images/inner_page_bnr.jpg?x67877"
  attribute :profile_picture, default: "https://res.cloudinary.com/dxftl1qzu/image/upload/v1611617383/default_image_wqbtcu.png"

  has_many :subscribers,
    class_name: "Subscription",
    foreign_key: "subscribed_to_id",
    dependent: :destroy

  def get_subscribers
    subscribers = self.subscribers
    subscribers.map{ |subscriber| subscriber.user }
  end

  def get_subscriptions
    subscriptions = self.subscriptions
    subscriptions.map{ |subscription|
      User.find(subscription.subscribed_to_id)
    }
  end



end
