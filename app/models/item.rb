class Item < ApplicationRecord
  has_one_attached :image
  #ActiveHashのbelongs_to_active_hashメソッドを使用できるようになる
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category

  validates :category_id, numericality: { other_than: 1 }
end
