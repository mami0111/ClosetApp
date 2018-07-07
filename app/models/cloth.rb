class Cloth < ApplicationRecord
	belongs_to :user
  has_one :category
  has_one :color

  # uploder	
  mount_uploader :image, ImageUploader
end
