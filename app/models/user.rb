class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
                
  with_options presence: true do
    validates :store
    VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
    validates :password, format: { with: VALID_PASSWORD_REGEX }
    validates :full_name, format: {with: /\A[ぁ-んァ-ン一-龥]/}
    validates :full_name_kana, format: {with: /\A[ァ-ヶー－]+\z/}
  end
end
