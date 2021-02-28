class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :shipping_fee
  belongs_to :region
  belongs_to :eta
  belongs_to :user
  has_one :order
  has_one_attached :image
  has_many :comments
  
  with_options presence: true do
    validates :product
    validates :description
    validates :states
    validates :shipping_fee_id, numericality: { other_than: 1 }
    validates :region_id, numericality: { other_than: 1 }
    validates :eta_id, numericality: { other_than: 1 }
    validates :price, format: {with: /\A[0-9]+\z/ }, numericality: { only_integer: true,
      greater_than: 0, less_than: 10000000 }
    validates :image
  end
end