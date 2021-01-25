class Video < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :dislikes, dependent: :destroy
  has_many :saved_videos, dependent: :destroy

  belongs_to :user
end
