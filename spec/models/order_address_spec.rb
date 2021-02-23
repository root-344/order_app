require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
    sleep 0.1
  end
  describe '商品購入' do
    context '保存ができるとき' do
     it '必要な項目に全て記載があれば保存できること' do
       expect(@order_address).to be_valid
     end
    end
    context '保存できないとき' do
      it 'zipが空だと保存できないこと' do
        @order_address.zip = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Zip can't be blank", "Zip is invalid. Include hyphen(-)")
      end
      it 'zipの保存にはハイフンが必要であること' do
        @order_address.zip = '1111111'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Zip is invalid. Include hyphen(-)")
      end
      it 'region_idが空だと保存できないこと' do
        @order_address.region_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Region Select")
      end
      it 'cityが空だと保存できないこと' do
        @order_address.city = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空だと保存できないこと' do
        @order_address.address = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address can't be blank")
      end
      it 'buildingが空だと保存できないこと' do
        @order_address.building = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Building can't be blank")
      end
      it 'phoneが空だと保存できないこと' do
        @order_address.phone = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone can't be blank", "Phone is invalid")
      end
      it '電話番号は11桁以内の数値でないと保存できないこと' do
        @order_address.phone = 111111111111
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone is invalid")
      end
      it 'phoneが全角数字だと保存できないこと' do
        @order_address.phone = "１２３４５６７８９０１"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone is invalid")
      end
      it 'phoneは英数混合では保存できないこと' do
        @order_address.phone = "1234567890a"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone is invalid")
      end
      it 'tokenが空では保存できないこと' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'user_idが空だと保存できないこと' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空だと保存できないこと' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
