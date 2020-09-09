require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "新規登録に必要なデータがあれば登録できる" do
      end
      it "passwordが6文字以上であれば登録できる" do
      end
    end

    context '新規投稿がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
      end
      it "emailが空だと登録できない" do
      end
      it "重複したemailが存在する場合は登録できない" do
      end
      it "emailが@を含まなければ登録できない" do
      end
      it "passwordが空だと登録できない" do
      end
      it "passwordが6文字以上でなければ登録できない" do
      end
      it "passwordが半角英数字混合でなければ登録できない" do
      end
      it "password_confirmationが空だと登録できない" do
      end
      it "新規登録・ログイン共にエラーハンドリングができている" do
      end
      it "family_nameが空だと登録できない" do
      end
      it "first_nameが空だと登録できない" do
      end
      it "family_nameが全角（漢字・ひらがな・カタカナ）でなければ登録できない" do
      end
      it "first_nameが全角（漢字・ひらがな・カタカナ）でなければ登録できない" do
      end
      it "family_name_katakanaが空だと登録できない" do
      end
      it "first_name_katakanaが空だと登録できない" do
      end
      it "family_name_katakanaが全角（カタカナ）でなければ登録できない" do
      end
      it "first_name_katakanaが全角（カタカナ）でなければ登録できない" do
      end
      it "birthdayが空だと登録できない" do
      end
    end
  end
end
