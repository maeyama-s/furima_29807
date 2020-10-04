require 'rails_helper'

RSpec.describe ItemSell, type: :model do
  before do
    @item_sell = FactoryBot.build(:item_sell)
  end

  describe '商品購入機能' do
    context '商品購入がうまくいくとき' do
      it '商品購入に必要なデータだあれば購入できる' do
        expect(@item_sell).to be_valid
      end
      it 'building_nameは空でも購入できる' do
        @item_sell.building_name = ''
        expect(@item_sell).to be_valid
      end
    end

    context '商品購入がうまくいかないとき' do
      it 'user_idが空だと購入できない' do
        @item_sell.user_id = ''
        @item_sell.valid?
        expect(@item_sell.errors.full_messages).to include('Userを入力してください')
      end
      it 'item_idが空だと購入できない' do
        @item_sell.item_id = ''
        @item_sell.valid?
        expect(@item_sell.errors.full_messages).to include('Itemを入力してください')
      end
      it 'post_codeが空だと購入できない' do
        @item_sell.post_code = ''
        @item_sell.valid?
        expect(@item_sell.errors.full_messages).to include('郵便番号を入力してください')
      end
      it 'post_codeが『○○○-○○○○』でないと購入できない' do
        @item_sell.post_code = '1234-567'
        @item_sell.valid?
        expect(@item_sell.errors.full_messages).to include('郵便番号は不正な値です')
      end
      it 'prefectures_idが1だと購入できない' do
        @item_sell.prefectures_id = 1
        @item_sell.valid?
        expect(@item_sell.errors.full_messages).to include('都道府県は1以外の値にしてください')
      end
      it 'cityが空だと購入できない' do
        @item_sell.city = ''
        @item_sell.valid?
        expect(@item_sell.errors.full_messages).to include('市町村区を入力してください')
      end
      it 'adressが空だと購入できない' do
        @item_sell.adress = ''
        @item_sell.valid?
        expect(@item_sell.errors.full_messages).to include('番地を入力してください')
      end
      it 'phone_numberが空だと購入できない' do
        @item_sell.phone_number = ''
        @item_sell.valid?
        expect(@item_sell.errors.full_messages).to include('電話番号を入力してください')
      end
      it 'phone_numberが整数でないと購入できない' do
        @item_sell.phone_number = '電話番号'
        @item_sell.valid?
        expect(@item_sell.errors.full_messages).to include('電話番号は数値で入力してください')
      end
      it 'phone_numberが整数11桁以内でないと購入できない' do
        @item_sell.phone_number = '123456789012'
        @item_sell.valid?
        expect(@item_sell.errors.full_messages).to include('電話番号は11文字以内で入力してください')
      end
      it 'tokenが空だと購入できない' do
        @item_sell.token = ''
        @item_sell.valid?
        expect(@item_sell.errors.full_messages).to include('クレジットカード情報を入力してください')
      end
    end
  end
end
