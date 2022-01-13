require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '商品購入' do
    before do
      @order_address = FactoryBot.build(:order_address)
    end

    context '購入に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_address).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @order_address.building_name = ''
        expect(@order_address).to be_valid
      end
    end

    context '購入に問題がある場合' do
      it '郵便番号が必須であること' do
        @order_address.zipcode = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Zipcode can't be blank")
      end
      it '郵便番号は「3桁ハイフン4桁」の半角文字列のみ保存可能なこと' do
        @order_address.zipcode = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Zipcode Input correctly")
      end
      it '都道府県が必須であること' do
        @order_address.shipment_source_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Shipment source Select")
      end
      it 'address1が必須であること' do
        @order_address.address1 = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address1 can't be blank")
      end
      it 'address2が必須であること' do
        @order_address.address2 = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address2 can't be blank")
      end
      it '電話番号が必須であること' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号は10桁以上11桁以内の半角数値のみ保存可能なこと' do
        @order_address.phone_number = '080123456789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number Input only number")
      end
      it 'tokenが空では登録出来ないこと' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
