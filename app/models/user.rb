class User < ApplicationRecord
  has_many :items
  has_many :comments
  has_many :salers
  has_one :address
end
