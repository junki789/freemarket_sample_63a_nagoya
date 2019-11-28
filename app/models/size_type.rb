class SizeType < ApplicationRecord
  has_many :items
  belongs_to :size
end
