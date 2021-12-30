class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates nickname, presence: true
  validates email, presence: true, uniqueness: true, format: { with: /@+/ }
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]{6,}+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください', confirmation: true
  validates family_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' }
  validates first_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' }
  validates phonetic_family_name, presence: true format: { with:/\A[\p{katakana} --&&[^ -~｡-ﾟ]]+\z/, meesage: "全角カタカナのみで入力して下さい" }
  validates phonetic_first_name, presence: true　format: { with:/\A[\p{katakana} --&&[^ -~｡-ﾟ]]+\z/, meesage: "全角カタカナのみで入力して下さい" }
  validates birth_date, presence: true
end
