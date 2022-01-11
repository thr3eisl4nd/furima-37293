class OrderAddress
  include ActiveModel::Model
  attr_accessor :zipcode, :shipment_source_id, :address1, :address2, :building_name, :phone_number, :order_id, :item_id, :user_id

  with_options presence: true do
    validates :zipcode, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :phone_number, format: {with: /\A0^[0-9]{10,11}\z/, message: "is invalid. Input half-width numbers"}
    validates :address1, :address2, :order_id, :item_id, :user_id
  end
  validates :shipment_source_id, numericality: {other_than: 1, message: "can't be blank"}

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(zipcode: zipcode, shipment_source_id: shipment_source_id, address1: address1, address2: address2, phone_number: phone_number, order_id: order.id)
  end
end