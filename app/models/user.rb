class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :nickname, presence: true
  validates :email, presence: true, format: { with: /@+/ }
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]{6,}+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, confirmation: true, allow_blank: true
  validates :family_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, allow_blank: true }
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, allow_blank: true }
  validates :phonetic_family_name, presence: true, format: { with: /\A[ァ-ヴー]+\z/, allow_blank: true }
  validates :phonetic_first_name, presence: true, format: { with: /\A[ァ-ヴー]+\z/, allow_blank: true }
  validates :birth_date, presence: true
end
