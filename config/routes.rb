Rails.application.routes.draw do
  resources :users, only: [:index, :create, :destroy, :show, :update]
  resources :videos, only: [:index, :create, :destroy, :update, :show]
  resources :comments, only: [:create, :update, :destroy]
  resources :subscriptions, only: [:create]
  resources :login, only: [:create]
  resources :likes, only: [:create, :destroy]
  resources :dislikes, only: [:create, :destroy]
  resources :saved_videos, only: [:create, :destroy]

  post '/subscriptions_remove', to: "subscriptions#destroy"
  get '/subscription_info/:id', to: "users#get_subscriber_information_on_user"
  get '/subscription_info', to: "users#get_subscriber_information"
  post '/userexists', to: "users#user_exists"
  get '/current_user', to: "users#get_current_user"
end
