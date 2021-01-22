class User < ApplicationRecord
  has_secure_password
  has_many :comments
  has_many :videos
  has_many :subscriptions
  has_many :likes
  has_many :dislikes

  has_many :subscribers,
    class_name: "Subscription",
    foreign_key: "subscribed_to_id"

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
