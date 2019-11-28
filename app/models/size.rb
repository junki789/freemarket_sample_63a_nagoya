class Size < ApplicationRecord
  has_many :size_types
  has_many :middle_categories
end
