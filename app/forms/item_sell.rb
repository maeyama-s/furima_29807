class ItemSell

  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :purchase_id, :post_code, :prefectures_id, :city, :adress, :building_name, :phone_number, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :city
    validates :adress
    validates :phone_number, numericality: { only_integer: true }, length: {maximum: 11}
    validates :token
  end
  validates :prefectures_id, numericality: { other_than: 1 }

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(
      purchase_id: purchase.id, post_code: post_code, prefectures_id: prefectures_id, city: city,
      adress: adress, building_name: building_name, phone_number: phone_number
      )
  end
end