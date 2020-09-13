class Item < ApplicationRecord
  # ActiveStorageとItemテーブルのアソシエーション
  has_one_attached :image
  # 各項目のバリデーション
  validates :image, presence: true
  validates :title, presence: true
  validates :explanation, presence: true
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than: 10_000_000}
  # ActiveHashのbelongs_to_active_hashメソッドを使用できるようになる
  extend ActiveHash::Associations::ActiveRecordExtensions
  # プルダウン項目のアソシエーション
  belongs_to_active_hash :category
  belongs_to_active_hash :item_condition
  belongs_to_active_hash :shipping_charge
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :days_until_shipping
  # プルダウン項目の id: 1 (---) が保存されないようバリデーション
  validates :category_id, numericality: { other_than: 1 }
  validates :item_condition_id, numericality: { other_than: 1 }
  validates :shipping_charges_id, numericality: { other_than: 1 }
  validates :shipping_area_id, numericality: { other_than: 1 }
  validates :days_until_shipping_id, numericality: { other_than: 1 }
  # 他テーブルとのアソシエーション
  belongs_to :user
end
