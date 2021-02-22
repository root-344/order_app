require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品' do
    before do
      @item = FactoryBot.build(:item)
    end
    context do
      it '全ての項目が正しく記述できれば出品できること' do
        @item.valid?
        expect(@item).to be_valid
      end
    end
    context do
      it 'imageを1枚つけることが必須であること' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'productが必須であること' do
        @item.product = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Product can't be blank")
      end
      it 'descriptionが必須であること' do
        @item.description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'statesについての情報が必須であること' do
        @item.states = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("States can't be blank")
      end
      it 'shippind_fee_idについての情報が必須であること' do
        @item.shipping_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee must be other than 1")
      end
      it 'reion_idについての情報が必須であること' do
        @item.region_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Region must be other than 1")
      end
      it 'eta_idについての情報が必須であること' do
        @item.eta_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Eta must be other than 1")
      end
      it 'priceについての情報が必須であること' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceは、¥0では出品できないこと' do
        @item.price = 0
        @item.valid? 
        expect(@item.errors.full_messages).to include("Price must be greater than 0")
      end
      it 'priceは、¥10,000,000以上では出品できないこと' do
        @item.price = 1000000000000
        @item.valid? 
        expect(@item.errors.full_messages).to include("Price must be less than 10000000")
      end
      it 'priceは半角数字のみ保存可能であること' do
        @item.price = '１１１１１'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
    end
  end
end
