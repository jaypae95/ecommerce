class Item < ApplicationRecord
  belongs_to :category
  has_many :wishlists
  mount_uploader :avatar, AvatarUploader
end
