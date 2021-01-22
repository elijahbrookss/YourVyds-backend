class Video < ApplicationRecord
  has_many :comments
  has_many :likes
  has_many :dislikes


  belongs_to :user
end
