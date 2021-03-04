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
    validates :shipping_fee_id, numericality: { other_than: 1, message: 'を選んで下さい' }
    validates :region_id, numericality: { other_than: 1, message: 'を選んで下さい' }
    validates :eta_id, numericality: { other_than: 1, message: 'を選んで下さい' }
    validates :price, format: { with: /\A[0-9]+\z/ }, numericality: { only_integer: true,
                                                                      greater_than: 0, less_than: 10_000_000 }
    validates :image
  end

  def self.search(search)
    if search != ''
      Item.where('product LIKE(?)', "%#{search}%")
    else
      Item.all
    end
  end
end
