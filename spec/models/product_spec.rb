require 'rails_helper'

RSpec.describe Product, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  before do
    @product = FactoryBot.build(:product)
  end

  describe '商品出品' do
    context '商品出品がうまくいくとき' do
      it '全ての項目が入力されていれば出品ができる' do
        expect(@product).to be_valid
      end
    
    context '商品出品がうまくいかないとき' do
      it 'imageが空では登録されない' do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Image can't be blank")
      end
      it 'product_nameが空では登録されない' do
        @product.product_name = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Product name can't be blank")
      end
      it 'descriptionが空では登録されない' do
        @product.description = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Description can't be blank")
      end
        it 'category_idが空では登録されない' do
        @product.category_id = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Category can't be blank")
      end
        it 'product_status_idが空では登録されない' do
        @product.product_status_id = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Product status can't be blank")
      end
        it 'shipping_fee_idが空では登録されない' do
        @product.shipping_fee_id = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Shipping fee can't be blank")
      end
      it 'shipping_area_idが空では登録されない' do
        @product.shipping_area_id = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Shipping area can't be blank")
      end
      it 'shipping_day_idが空では登録されない' do
        @product.shipping_day_id = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Shipping day can't be blank")
      end
      it 'category_idで1が選択された場合は登録されない' do
        @product.category_id = '1'
        @product.valid?
        expect(@product.errors.full_messages).to include("Category can't be blank")
      end
      it 'product_status_idで1が選択された場合は登録されない' do
        @product.product_status_id = '1'
        @product.valid?
        expect(@product.errors.full_messages).to include("Product status can't be blank")
      end
      it 'shipping_fee_idで1が選択された場合は登録されない' do
        @product.shipping_fee_id = '1' 
        @product.valid?
        expect(@product.errors.full_messages).to include("Shipping fee can't be blank")
      end
      it 'shipping_area_idで1が選択された場合は登録されない' do
        @product.shipping_area_id = '1'
        @product.valid?
        expect(@product.errors.full_messages).to include("Shipping area can't be blank")
      end
      it 'shipping_day_idで1が選択された場合は登録されない' do
        @product.shipping_day_id = '1'
        @product.valid?
        expect(@product.errors.full_messages).to include("Shipping day can't be blank")
      end
      it 'priceが空では登録されない' do
        @product.price = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが半角数字以外では登録できない' do
        @product.price = "１０００"
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is not a number")
      end
      it 'priceが300より少ないと登録できない' do
        @product.price = "50"
        @product.valid?
        expect(@product.errors.full_messages).to include("Price must be greater than 300")
      end
      it 'priceが9999999より少ないと登録できない' do
        @product.price = "10000000"
        @product.valid?
        expect(@product.errors.full_messages).to include("Price must be less than 9999999")
      end
    end
    end
  end
end
