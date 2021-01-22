class SubscriptionsController < ApplicationController

  def create
    subscription = Subscription.new(subscription_params)
    user = User.find(subscription_params[:user_id])
    if subscription.save
      render json: SubscriberSerializer.new(user).serialize
    end
  end

  def destroy
    subscription = Subscription.where(subscription_params)
    # Is subscription am array, or an individual subscription?
    if subscription[0]
      subscription[0].destroy
    end
  end
  private

  def subscription_params
    params.require(:subscription).permit(:user_id, :subscribed_to_id)
  end
end
