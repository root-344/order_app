class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :zip, :region_id, :city, :address, :building, :phone, :token
  
  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :zip, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "にはハイフンを入れてください。"}
    validates :city
    validates :address
    validates :building
    validates :phone, format: {with: /\A\d{10}\z|\A\d{11}\z/ }
    validates :token
  end  
  validates :region_id, numericality: {other_than: 1, message: "を選んで下さい"}

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(zip: zip, region_id: region_id, city: city, address: address, building: building, phone: phone, order_id: order.id)
  end
end