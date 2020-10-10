class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # 追加カラムのバリデーション
  validates :nickname, presence: true
  validates :birthday, presence: true
  # passwordの英数字混合のバリデーション
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX
  # 漢字・ひらがな・カタカナ指定
  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ } do
    validates :family_name
    validates :first_name
  end
  # カタカナ指定
  with_options presence: true, format: { with: /\A[ァ-ン]+\z/ } do
    validates :family_name_katakana
    validates :first_name_katakana
  end
  # 他テーブルとのアソシエーション
  has_many :items
  has_many :purchases
  has_many :comments
  has_many :favorites
  # 親モデルが削除された時、それに紐付ている子モデルも一緒に削除されるというオプション。
  has_one :card, dependent: :destroy
end
