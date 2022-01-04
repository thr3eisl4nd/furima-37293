require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
    describe "ユーザー新規登録" do
      context '新規登録できるとき' do
        it 'nickname, email, password, password_confirmation, family_name, first_name, phonetic_family_name, phonetic_first_name, birth_dateがあれば登録できる' do
          expect(@user).to be_valid
        end 
      end
      context '新規登録できないとき' do
        it 'nicknameが空では登録できない' do
          @user.nickname = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Nickname can't be blank")
        end
        it 'emailが空では登録できない' do
          @user.email = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end
        it '重複したemailが存在する場合は登録できない' do
          @user.save
          another_user = FactoryBot.build(:user)
          another_user.email = @user.email
          another_user.valid?
          expect(another_user.errors.full_messages).to include("Email has already been taken")
        end
        it 'emailに@がないと登録できない' do
          @user.email = 'lila.robelhotmail.com'
          @user.valid?
          expect(@user.errors.full_messages).to include("Email is invalid")
        end
        it 'passwordが空だと登録できない' do
          @user.password = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end
        it 'passwordとpassword_confirmationが不一致では登録できない' do
          @user.password_confirmation = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end
        it 'passwordが5文字以下だと登録できない' do
          @user.password = 'abcd1'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
        end
        it 'passwordは半角英数字混合でないと登録できない' do
          @user.password = 'abcdef'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is invalid")
        end
        it '名字(全角)がないと登録できない' do
          @user.family_name = 'Tanaka'
          @user.valid?
          expect(@user.errors.full_messages).to include("Family name is invalid")
        end
        it '名前(全角)がないと登録できない' do
          @user.first_name = 'Taro'
          @user.valid?
          expect(@user.errors.full_messages).to include("First name is invalid")
        end
        it '名字カナ(全角)がないと登録できない' do
          @user.phonetic_family_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Phonetic family name can't be blank")
        end
        it '名前カナ(全角)がないと登録できない' do
          @user.phonetic_first_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Phonetic first name can't be blank")
        end
        it '名字カナ(全角)は全角カタカナでの入力がないと登録できない' do
          @user.phonetic_family_name = 'ﾀﾅｶ'
          @user.valid?
          expect(@user.errors.full_messages).to include("Phonetic family name is invalid")
        end
        it '名前カナ(全角)は全角カタカナでの入力がないと登録できない' do
          @user.phonetic_first_name = 'ﾀﾛｳ'
          @user.valid?
          expect(@user.errors.full_messages).to include("Phonetic first name is invalid")
        end
        it '生年月日がないと登録できない' do
          @user.birth_date = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Birth date can't be blank")
        end
      end
    end
end
