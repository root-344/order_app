require 'rails_helper'

RSpec.describe User, type: :model do
  describe '新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end
   context '新規登録できるとき' do
    it '全ての項目が記述できれば新規登録できること' do
      expect(@user).to be_valid
    end
    it 'パスワードは、6文字以上での入力が必須であること（6文字が入力されていれば、登録が可能なこと）' do
      @user.password = 'michi1'
      @user.password_confirmation = 'michi1'
      @user.valid?
      expect(@user).to be_valid
    end
    it 'passwordが半角英数字が混合されていれば、新規登録できること' do
        @user.password = 'aaa999'
        @user.password_confirmation = 'aaa999'
        @user.valid?
        expect(@user).to be_valid
    end 
   end
   context '新規登録できないとき' do
    it 'last_nameが必須であること' do
      @user.last_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank", "Last name is invalid")
    end
    it 'first_nameが必須であること' do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank", "First name is invalid")
    end
    it 'last_nameは、全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
      @user.last_name = "aaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid")
    end
    it 'first_nameは、全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
      @user.first_name = "aaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
    end
    it 'last_name_kanaが必須であること' do
      @user.last_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank", "Last name kana is invalid")
    end
    it 'first_name_kanaが必須であること' do
      @user.first_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank", "First name kana is invalid")
    end
    it 'last_name_kanaは、全角（カタカナ）での入力が必須であること' do
      @user.last_name_kana = "aaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana is invalid")
    end
    it 'first_name_kanaは、全角（カタカナ）での入力が必須であること' do
      @user.first_name_kana = "aaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
    end
    it 'storeが必須であること' do
      @user.store = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Store can't be blank")
    end
    it 'emailが必須であること' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'emailが一意性であること' do
      @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'emailは、@を含む必要があること' do
      @user.email = "aaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it 'passwordが必須であること' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordは、6文字以上での入力が必須であること' do
      @user.password = "aaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it 'passwordは、確認用を含めて2回入力すること' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'passwordとpassword_confirmationは、値の一致が必須であること' do
      @user.password = "michi1"
      @user.password_confirmation = "michi2"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'passwordは、半角数字のみでは登録できないこと' do
      @user.password = "1111111"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'passwordは、半角英語のみでは登録できないこと' do
      @user.password = "aaaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
   end
  end
end
