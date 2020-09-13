require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload("#{::Rails.root}/spec/images/star.png")
  end

  describe '商品出品' do
    context '商品出品がうまくいくとき' do
      it '商品出品に必要なデータだあれば出品できる' do
        expect(@item).to be_valid
      end
    end

    context '商品出品がうまくいかないとき' do
    end
  end
end
