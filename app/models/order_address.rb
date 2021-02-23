class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :zip, :region_id, :city, :address, :building, :phone
  
  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :zip, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :address
    validates :phone, format: {with: /\A\d{10}\z|\A\d{11}\z/ }
  end  
  validates :region_id, numericality: {other_than: 1, message: "Select"}

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(zip: zip, region_id: region_id, city: city, address: address, building: building, phone: phone, order_id: order.id)
  end
end