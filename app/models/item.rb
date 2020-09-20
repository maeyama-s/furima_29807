class Item < ApplicationRecord
  # ActiveStorageとItemテーブルのアソシエーション
  has_one_attached :image
  # 各項目のバリデーション
  with_options presence: true do
    validates :image
    validates :title
    validates :explanation
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than: 10_000_000 }
  end
  # ActiveHashのbelongs_to_active_hashメソッドを使用できるようになる
  extend ActiveHash::Associations::ActiveRecordExtensions
  # プルダウン項目のアソシエーション
  belongs_to_active_hash :category
  belongs_to_active_hash :item_condition
  belongs_to_active_hash :shipping_charges
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :days_until_shipping
  # プルダウン項目の id: 1 (---) が保存されないようバリデーション
  with_options numericality: { other_than: 1 } do
    validates :category_id, {}
    validates :item_condition_id, {}
    validates :shipping_charges_id, {}
    validates :shipping_area_id, {}
    validates :days_until_shipping_id, {}
  end
  # 他テーブルとのアソシエーション
  belongs_to :user
  has_one :purchase
end
