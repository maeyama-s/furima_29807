class Item < ApplicationRecord
  # ActiveStorageとItemテーブルのアソシエーション
  has_many_attached :images
  # 各項目のバリデーション
  with_options presence: true do
    validates :images
    validates :title
    validates :explanation
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than: 10_000_000 }
    validates :item_condition_id
    validates :shipping_charges_id
    validates :shipping_area_id
    validates :days_until_shipping_id
  end
  # ActiveHashのbelongs_to_active_hashメソッドを使用できるようになる
  extend ActiveHash::Associations::ActiveRecordExtensions
  # プルダウン項目のアソシエーション
  belongs_to_active_hash :item_condition
  belongs_to_active_hash :shipping_charges
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :days_until_shipping
  # 他テーブルとのアソシエーション
  belongs_to :user
  has_one :purchase
  belongs_to :category
  # 親モデルが削除されたとき、それに紐付ている子モデルも一緒に削除するようオプションつける。
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def self.search(search)
    if search != ""
      Item.where('title LIKE(?)', "%#{search}%")
    else
      Item.all
    end
  end
end
