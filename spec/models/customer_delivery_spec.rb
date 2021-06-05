require 'rails_helper'

RSpec.describe CustomerDelivery, type: :model do
  describe '商品の購入' do
    before do
      user = FactoryBot.create(:user)
      @customer_delivery = FactoryBot.build(:customer_delivery, user_id: user.id)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@customer_delivery).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @customer_delivery.building_name = ''
        expect(@customer_delivery).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postcodeが空だと保存できないこと' do
        @customer_delivery.postcode = ''
        @customer_delivery.valid?
        expect(@customer_delivery.errors.full_messages).to include("Postcode can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @customer_delivery.postcode = '1234567'
        @customer_delivery.valid?
        expect(@customer_delivery.errors.full_messages).to include('Postcode is invalid. Include hyphen(-)')
      end
      it 'area_idを選択していないと保存できないこと' do
        @customer_delivery.area_id = 0
        @customer_delivery.valid?
        expect(@customer_delivery.errors.full_messages).to include("Area_id can't be blank")
      end
      it 'cityが空だと保存できないこと' do
        @customer_delivery.city = ''
        @customer_delivery.valid?
        expect(@customer_delivery.errors.full_messages).to include("City can't be blank")
      end
      it 'house_numberが空だと保存できないこと' do
        @customer_delivery.house_number = ''
        @customer_delivery.valid?
        expect(@customer_delivery.errors.full_messages).to include("House_number can't be blank")
      end
      it 'phone_numberが空だと保存できないこと' do
        @customer_delivery.phone_number = ''
        @customer_delivery.valid?
        expect(@customer_delivery.errors.full_messages).to include("Phone_number can't be blank")
      end
      it 'phone_numberが半角のハイフンを含んでいると保存できないこと' do
        @customer_delivery.phone_number = '090-1234-5678'
        @customer_delivery.valid?
        expect(@customer_delivery.errors.full_messages).to include('Phone_number is invalid. Include hyphen(-)')
      end
      it 'userが紐付いていないと保存できないこと' do
        @customer_delivery.user_id = nil
        @customer_delivery.valid?
        expect(@customer_delivery.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @customer_delivery.item_id = nil
        @customer_delivery.valid?
        expect(@customer_delivery.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end