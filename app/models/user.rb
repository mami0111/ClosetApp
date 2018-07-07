class User < ApplicationRecord
  # 自分で追加したnameカラムにバリデーション（ミニュ力はエラー）を追加
  validates :name, presence:true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
