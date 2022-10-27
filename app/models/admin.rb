class Admin < ApplicationRecord
  has_one_attached :admin_image
  has_many :restaurants, dependent: :destroy  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end
