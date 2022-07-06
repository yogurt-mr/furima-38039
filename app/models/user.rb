class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password, format: { with: VALID_PASSWORD_REGEX}
  validates :nickname, presence: true
  validates :last_name, presence: true
  validates :first_name, presence: true
  # VALID_LAST_NAME_REGEX = /\A[ぁ-んァ-ヶ一-龥]/+\z
  #validates :last_name, format: {with:/\A[\p{katakana}\p{blank}ー－]+\z/, message: "aaaa"}
  #validates_format_of :first_name, format: {with: '/\A[ぁ-んァ-ヶ一-龥]/+\z', message: "aaaa"} #with: /\A[ぁ-んァ-ヶ一-龥]/+\z
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :last_name_kana, format: {with:/\A[\p{katakana}\p{blank}ー－]+\z/}
  validates :first_name_kana, format: {with:/\A[\p{katakana}\p{blank}ー－]+\z/}
  validates :dob, presence: true

end
