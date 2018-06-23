class Cloth < ApplicationRecord
	 # uploder	
  mount_uploader :image, ImageUploader
end
