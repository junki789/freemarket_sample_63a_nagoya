class Item < ApplicationRecord
  has_many :sellers, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :item_images, dependent: :destroy
  has_many :users, through: :sellers
  # belongs_to :size_type
  accepts_nested_attributes_for :item_images, allow_destroy: true
  # belongs_to :user
  
end
