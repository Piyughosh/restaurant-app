class Review < ApplicationRecord
  belongs_to :user
  belongs_to :comment, polymorphic: true
end
