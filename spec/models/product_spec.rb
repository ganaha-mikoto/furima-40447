require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
  end

  context '商品の新規登録ができる場合' do
    it '全ての情報が正しく入力されていれば登録できる' do
      expect(@product).to be_valid
    end
  end

  context '商品の新規登録ができない場合' do
    it '商品名が空では登録できない' do
      @product.name = ''
      @product.valid?
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it '説明が空では登録できない' do
      @product.description = ''
      @product.valid?
      expect(@product.errors.full_messages).to include("Description can't be blank")
    end

    it 'カテゴリーが選択されていないと登録できない' do
      @product.category_id = 1
      @product.valid?
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end

    it '商品の状態が選択されていないと登録できない' do
      @product.condition_id = 1
      @product.valid?
      expect(@product.errors.full_messages).to include("Condition can't be blank")
    end

    it '配送料の負担が選択されていないと登録できない' do
      @product.shipping_charge_id = 1
      @product.valid?
      expect(@product.errors.full_messages).to include("Shipping charge can't be blank")
    end

    it '発送元の地域が選択されていないと登録できない' do
      @product.shipping_area_id = 1
      @product.valid?
      expect(@product.errors.full_messages).to include("Shipping area can't be blank")
    end

    it '発送までの日数が選択されていないと登録できない' do
      @product.shipping_day_id = 1
      @product.valid?
      expect(@product.errors.full_messages).to include("Shipping day can't be blank")
    end

    it '価格が空では登録できない' do
      @product.price = ''
      @product.valid?
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    it '価格が数値でなければ登録できない' do
      @product.price = 'abc'
      @product.valid?
      expect(@product.errors.full_messages).to include("Price must be between 1 and 9999999")
    end

    it '価格が0以下では登録できない' do
      @product.price = 0
      @product.valid?
      expect(@product.errors.full_messages).to include("Price must be between 1 and 9999999")
    end

    it '価格が1,000,000以上では登録できない' do
      @product.price = 10000000
      @product.valid?
      expect(@product.errors.full_messages).to include("Price must be between 1 and 9999999")
    end
  end
end
