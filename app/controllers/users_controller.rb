class UsersController < ApplicationController
  skip_before_action :authorized, except: [:destroy, :get_current_user]

  def index
    users = User.all
    render json: UserSerializer.new(users).serialize
  end

  def create
    user = User.new(user_params)
    if user.save
      token = encode_token(user_id: user.id)
      render json: { jwt: token }, status: :created
    else
      render json: { error: "Failed to create account" }, status: :not_acceptable
    end
  end

  def update
    user = User.find(params[:id])
    banner_img = params[:banner_picture]
    profile_img = params[:profile_picture]
    if user
      if profile_img
        profileFile = Cloudinary::Uploader.upload(profile_img,
           public_id: "pfp-" + user.id.to_s)['url']
        user.update(profile_picture: profileFile)
      end
      if banner_img
        bannerFile = Cloudinary::Uploader.upload(banner_img,
            public_id:"bfp-" + user.id.to_s)['url']
        user.update(banner_picture: bannerFile)
      end
    end

    render json: user
  end

  def destroy
    user = User.find(params[:id])
    if user
      user.destroy
    end
  end

  def show
    user = User.find(params[:id])
    render json: UserSerializer.new(user).serialize
  end

  def get_subscriber_information
    if current_user
      render json: SubscriberSerializer.new(current_user).serialize
    else
      render json: {message: "Please log in."}
    end
  end

  def get_subscriber_information_on_user
    user = User.find(params[:id])
    if user
      render json: SubscriberSerializer.new(user).serialize
    else
      render json: {message: "Please log in."}
    end
  end

  def user_exists
    username = user_params[:username]
    user = User.find_by(username: username)
    jsonmessage = {message: false}
    if user
      jsonmessage = {message: true, profile_picture: user.profile_picture}
    end
    render json: jsonmessage
  end

  def get_current_user
      render json: UserSerializer.new(current_user).serialize
  end


  private

  def user_params
    params.require(:user).permit(:username, :password)
  end


end
