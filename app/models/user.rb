class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true
    validates :nick_name
    validates :email, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
    validates :encrypted_password, confirmation: true, length: { minimum: 6 }
    with_options fomat: { with: [ぁ-んァ-ン一-龥] }
      validates :first_name
      validates :family_name
    end
    with_options format: { with: [ァ-ン] }
      validates :first_name_kana
      validates :family_name_kana
    end
    validates :birthday
  end
end
