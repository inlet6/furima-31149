class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :nick_name, presence: true
         validates :email, presence: true, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }

         validates :encrypted_password, confirmation: true, length: { minimum: 6 }
         validates :first_name, presence: true
         validates :family_name, presence: true
         validates :first_name_kana, presence: true, format: { with: [ァ-ン] }
         validates :family_name_kana, presence: true, format: { with: [ァ-ン] }
         validates :birthday , presence: true

end
