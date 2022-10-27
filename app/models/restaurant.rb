class Restaurant < ApplicationRecord
  belongs_to :admin
  has_many :dishes
  has_many :reviews, as: :comment
  has_one_attached :restaurant_image, dependent: :destroy
end
