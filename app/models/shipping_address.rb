class ShippingAddress < ApplicationRecord
  belongs_to :purchases
  belongs_to_active_hash :shipping_area
  with_options presence: true do
    validates :post_code, {}
    validates :city, {}
    validates :adress, {}
    validates :phone_number, {}
  end
  validates :prefectures_id, numericality: { other_than: 1 }
end
