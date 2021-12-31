require 'rails_helper'

RSpec.describe User, type: :model do
  describe "ユーザー新規登録" do
    context '新規登録できるとき' do
      it 'nickname, email, password, password_confirmation, family_name, first_name, phonetic_family_name, phonetic_first_name, birth_dateがあれば登録できる' do
      end 
    end
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
      end
      it 'emailが空では登録できない' do
      end
      it '重複したemailが存在する場合は登録できない' do
      end
      it 'emailに@がないと登録できない' do
      end
      it 'passwordが空だと登録できない' do
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
      end
      it 'passwordが5文字以下だと登録できない' do
      end
      it 'passwordは半角英数字混合でないと登録できない' do
      end
      it '名字(全角)がないと登録できない' do
      end
      it '名前(全角)がないと登録できない' do
      end
      it '名字カナ(全角)がないと登録できない' do
      end
      it '名前カナ(全角)がないと登録できない' do
      end
      it 'お名前カナ(全角)は全角カタカナでの入力がないと登録できない' do
      end
      it '生年月日がないと登録できない' do
      end
    end
  end
end
