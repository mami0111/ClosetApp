class PagesController < ApplicationController
  def index
  end

  def show
  	array="トップス","ジャケット/アウター","オールインワン"
  	array.each do |attr|
  	  category= Category.new(name:attr)
      category.save
  	end
  end
end
