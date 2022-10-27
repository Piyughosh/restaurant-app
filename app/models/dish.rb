class Dish < ApplicationRecord
  belongs_to :restaurant
  has_many :reviews, as: :comment
  has_one_attached :dish_image
end
