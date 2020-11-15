require 'rails_helper'
describe Item do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品がうまくいく時' do
      it '全ての項目が存在すれば出品できる' do
        expect(@item).to be_valid
      end
      it 'nameが40文字以内なら登録できる' do
        expect(@item).to be_valid
      end
      it 'detailsが1000文字以内なら登録できる' do
        expect(@item).to be_valid
      end
      it 'category_idが1以外なら登録できる' do
        expect(@item).to be_valid
      end
      it 'item_ststus_idが1以外なら登録できる' do
        expect(@item).to be_valid
      end
      it 'shipping_burden_idが1以外なら登録できる' do
        expect(@item).to be_valid
      end
      it 'prefecture_idが1以外なら登録できる' do
        expect(@item).to be_valid
      end
      it 'days_to_shipが1以外なら登録できる' do
        expect(@item).to be_valid
      end
      it 'priceが300以上9999999以下なら登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品出品がうまくいかない時' do
      it 'imageが空だと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameが空だと登録できない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'nameが40字以上だと登録できない' do
        @item.name = Faker::Lorem.characters(41)
        @item.valid?
        expect(@item.errors.full_messages).to include('Name is too long (maximum is 40 characters)')
      end
      it 'detailsが空だと登録できない' do
        @item.details = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Details can't be blank")
      end
      it 'detailsが1000字以上だと登録できない' do
        @item.details = Faker::Base.regexify('[aあ]{1001}')
        @item.valid?
        expect(@item.errors.full_messages).to include('Details is too long (maximum is 1000 characters)')
      end
      it 'category_idが1だと登録できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end
      it 'shipping_burden_idが1だと登録できない' do
        @item.shipping_burden_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping burden must be other than 1')
      end
      it 'prefecture_idが1だと登録できない' do
        @item.prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture must be other than 1')
      end
      it 'days_to_ship_idが1だと登録できない' do
        @item.days_to_ship_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Days to ship must be other than 1')
      end
      it 'priceが空だと登録できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが300以下だと登録できない' do
        @item.price = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end
      it 'priceが9999999以上だと登録できない' do
        @item.price = '9999999999'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end
    end
  end
end
