class Cloth < ApplicationRecord
	belongs_to :user
  belongs_to :category
  belongs_to :color

  # uploder	
  mount_uploader :image, ImageUploader

  # バリデーション
  validates :name, {presence: true}
  validates :image, {presence: true}


end
