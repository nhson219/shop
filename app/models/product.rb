class Product < ActiveRecord::Base
  belongs_to :product_category
  mount_uploader :avatar,AvatarUploader
  has_many :comments,as: :commentable
end
