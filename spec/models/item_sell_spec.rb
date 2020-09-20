require 'rails_helper'

RSpec.describe ItemSell, type: :model do
  before do
    @item_sell = FactoryBot.build(:item_sell)
  end

  describe '商品購入機能' do
    context '商品購入がうまくいくとき' do
      it "商品購入に必要なデータだあれば購入できる" do
        expect(@item_sell).to be_valid
      end
      it "building_nameは空でも購入できる" do
        @item_sell.building_name = ""
        expect(@item_sell).to be_valid
      end
    end

    context '商品購入がうまくいかないとき' do
      it "user_idが空だと購入できない" do
        @item_sell.user_id = ""
        @item_sell.valid?
        expect(@item_sell.errors.full_messages).to include("User can't be blank")
      end
      it "item_idが空だと購入できない" do
        @item_sell.item_id = ""
        @item_sell.valid?
        expect(@item_sell.errors.full_messages).to include("Item can't be blank")
      end
      it "post_codeが空だと購入できない" do
        @item_sell.post_code = ""
        @item_sell.valid?
        expect(@item_sell.errors.full_messages).to include("Post code can't be blank")
      end
      it "post_codeが『○○○-○○○○』でないと購入できない" do
        @item_sell.post_code = "1234-567"
        @item_sell.valid?
        expect(@item_sell.errors.full_messages).to include("Post code is invalid")
      end
      it "prefectures_idが1だと購入できない" do
        @item_sell.prefectures_id = 1
        @item_sell.valid?
        expect(@item_sell.errors.full_messages).to include("Prefectures must be other than 1")
      end
      it "cityが空だと購入できない" do
        @item_sell.city = ""
        @item_sell.valid?
        expect(@item_sell.errors.full_messages).to include("City can't be blank")
      end
      it "adressが空だと購入できない" do
        @item_sell.adress = ""
        @item_sell.valid?
        expect(@item_sell.errors.full_messages).to include("Adress can't be blank")
      end
      it "phone_numberが空だと購入できない" do
        @item_sell.phone_number = ""
        @item_sell.valid?
        expect(@item_sell.errors.full_messages).to include("Phone number can't be blank")
      end
      it "phone_numberが整数でないと購入できない" do
        @item_sell.phone_number = "電話番号"
        @item_sell.valid?
        expect(@item_sell.errors.full_messages).to include("Phone number is not a number")
      end
      it "phone_numberが整数11桁以内でないと購入できない" do
        @item_sell.phone_number = "123456789012"
        @item_sell.valid?
        expect(@item_sell.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
      end
      it "tokenが空だと購入できない" do
        @item_sell.token = ""
        @item_sell.valid?
        expect(@item_sell.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
