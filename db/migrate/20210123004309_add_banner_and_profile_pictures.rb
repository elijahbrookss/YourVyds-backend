class AddBannerAndProfilePictures < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :banner_picture, :string
    add_column :users, :profile_picture, :string
  end
end
