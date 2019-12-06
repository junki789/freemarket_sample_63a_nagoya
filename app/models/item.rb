class Item < ApplicationRecord
  has_many :sellers, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :item_images, dependent: :destroy
  belongs_to :user
  belongs_to :size_type
end
