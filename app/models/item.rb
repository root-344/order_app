class Item < ApplicationRecord
  with_options presence: true do
    validates :product
    validates :description
    validates :states
    validates :shipping_fee_id, numericality: { other_than: 1 }
    validates :region_id, numericality: { other_than: 1 }
    validates :eta_id, numericality: { other_than: 1 }, format: {with: /\A[0-9]+\z/ }
    validates :price, format: {with: /\A[0-9]+\z/ }, numericality: { only_integer: true,
      greater_than: 0, less_than: 10000000 }
    validates :image
  end
end
