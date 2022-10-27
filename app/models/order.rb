class Order < ApplicationRecord
  belongs_to :user
  has_one_attached :dish_image
end
