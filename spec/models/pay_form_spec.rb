require 'rails_helper'
describe PayForm do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @pay_form = FactoryBot.build(:pay_form, user_id: @user.id, item_id: @item.id)
  end

  describe '商品購入' do
    context '商品が購入できる時' do
      it 'billding_name以外の項目が存在すれば購入できる' do
      expect(@pay_form).to be_valid
      end
    end

    context '商品が購入できない時' do
      it 'postal_codeが空だと登録できない' do
        @pay_form.postal_code = nil
        @pay_form.valid?
        expect(@pay_form.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeはハイフン(123-4567)がなくては登録できない' do
        @pay_form.postal_code = "1234567"
        @pay_form.valid?
        expect(@pay_form.errors.full_messages).to include("Postal code is invalid")
      end
      it 'prefecture_idが空だと登録できない' do
        @pay_form.prefecture_id = nil
        @pay_form.valid?
        expect(@pay_form.errors.full_messages).to include("Prefecture can't be blank", "Prefecture is not a number")
      end
      it 'prefecture_idが1だと登録できない' do
        @pay_form.prefecture_id = 1
        @pay_form.valid?
        expect(@pay_form.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it 'municipalityが空だと登録できない' do
        @pay_form.municipality = nil
        @pay_form.valid?
        expect(@pay_form.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'addressが空だと登録できない' do
        @pay_form.address = nil
        @pay_form.valid?
        expect(@pay_form.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空だと登録できない' do
        @pay_form.phone_number = nil
        @pay_form.valid?
        expect(@pay_form.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberが11桁の数列でないと登録できない' do
        @pay_form.phone_number = "1234567890"
        @pay_form.valid?
        expect(@pay_form.errors.full_messages).to include("Phone number is invalid")
      end
      it 'tokenが空だと登録できない' do
        @pay_form.token = nil
        @pay_form.valid?
        expect(@pay_form.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end