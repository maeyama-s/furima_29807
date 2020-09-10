class Item < ApplicationRecord
  has_one_attached :image
  #ActiveHashのbelongs_to_active_hashメソッドを使用できるようになる
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :item_condition
  belongs_to_active_hash :shipping_charge
  belongs_to_active_hash :shipping_area

  validates :category_id, numericality: { other_than: 1 }
  validates :item_condition_id, numericality: { other_than: 1 }
  validates :shipping_charges_id, numericality: { other_than: 1 }
  validates :shipping_area_id, numericality: { other_than: 1 }
end
