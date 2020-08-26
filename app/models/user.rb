class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
   validates :name, presence: true, length: { in: 2..20 }
   validates :introduction, presence: true, length: { maximum: 50 }


   has_many :post_images, dependent: :destroy
   has_many :books,dependent: :destroy
   attachment :image

end
