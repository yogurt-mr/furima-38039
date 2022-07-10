require 'rails_helper'

RSpec.describe PurchaseForm, type: :model do
  describe '購入者情報の保存' do
    before do
      @user = FactoryBot.create(:user)
      @product = FactoryBot.create(:product)
      @purchase_form = FactoryBot.build(:purchase_form, user_id: @user.id, product_id: @product.id)
      sleep 0.1 #”MySQL client is not connected”エラーの対応
    end

      it '全ての項目が入力されていれば購入ができる' do
        expect(@purchase_form).to be_valid
      end

      it 'user_idがnilだと購入ができない' do 
        @purchase_form.user_id = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("User can't be blank")
      end
      it 'product_idがnilだと購入ができない' do
        @purchase_form.product_id = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Product can't be blank")
      end

      it 'token(クレジットカード情報)が空だと購入ができない' do
        @purchase_form.token = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Token can't be blank")
      end
      it '郵便番号が空だと購入ができない' do
        @purchase_form.zip_code = ""
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Zip code can't be blank") 
      end
      it '郵便番号にハイフンがないと登録できない' do
        @purchase_form.zip_code = "1234567"
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Zip code is invalid. Include hyphen(-)")
      end
      it '郵便番号が「3桁＋ハイフン＋4桁」の組み合わせでないと購入できない' do
        @purchase_form.zip_code = "123-45678"
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Zip code is invalid. Include hyphen(-)")
      end
      it 'shipping_area_idが空だと購入できない' do
        @purchase_form.shipping_area_id = '1'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Shipping area can't be blank")
      end
      it 'cityが空だと購入できない' do
        @purchase_form.city = ""
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("City can't be blank")
      end
      it 'block_nameが空だと購入できない' do
        @purchase_form.street_number = ""
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Street number can't be blank")
      end
      it 'phone_numberが空だと購入できない' do
        @purchase_form.phone_number = ""
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberに半角数字以外が入力されている場合は購入できない' do
        @purchase_form.phone_number = ""
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberが9桁桁以下では購入できない' do
        @purchase_form.phone_number = "080123456"
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberが12桁以上では購入できない' do
        @purchase_form.phone_number = "080123456789"
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Phone number is invalid")
      end
  end
end 