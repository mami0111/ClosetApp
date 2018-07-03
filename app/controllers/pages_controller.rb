class PagesController < ApplicationController
  def index
  end

  def show
  		array=[
  				{name:"ベージュ", code:"#F5F5DC"},
  				{name:"ホワイト", code:"#FFFFFF"},
  				{name:"レッド", code:"#FF0000"},
  				{name:"ピンク", code:"#FFC0CB"},
  				{name:"オレンジ", code:"#FFA500"},
  				{name:"イエロー", code:"#FFFF00"},
  				{name:"ネイビー", code:"#000080"},
  				{name:"ブルー", code:"#0000FF"},
  				{name:"パープル", code:"#800080"},
  				{name:"グリーン", code:"#008000"},
  				{name:"カーキ", code:"#F0E68C"},
  				{name:"その他", code:"#c0c0c0"}
  			]
  		array.each do|attr|
  			color=Color.new(name:attr[:name],code:attr[:code])
  			color.save
  		end

  end
end
