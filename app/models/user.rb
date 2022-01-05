class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :items

  validates :nickname, presence: true
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]{6,}+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: "is invalid. Include both letters and numbers."
  validates :family_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "is invalid. Input full-width characters." }
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "is invalid. Input full-width characters." }
  validates :phonetic_family_name, presence: true, format: { with: /\A[ァ-ヴー]+\z/, message: "is invalid. Input full-width katakana characters." }
  validates :phonetic_first_name, presence: true, format: { with: /\A[ァ-ヴー]+\z/, message: "is invalid. Input full-width katakana characters." }
  validates :birth_date, presence: true
end
