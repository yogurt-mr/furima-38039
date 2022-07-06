require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  # pending "add some examples to (or delete) #{__FILE__}"
  describe 'ユーザー新規登録' do
     it 'nicknameが空では登録できない' do
       user = User.new(nickname: '', email: 'test@example', password: '000000', password_confirmation: '000000')
       user.valid?
       expect(user.errors.full_messages).to include("Nickname can't be blank")
     end
     it 'ニックネームが必須であること。' do
       @user.nickname = ''
       @user.valid?
       expect(@user.errors.full_messages).to include "Nickname can't be blank"
     end
    it 'メールアドレスが必須であること。' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end
    it 'メールアドレスが一意性であること。' do
      @user.save
      @another_user = FactoryBot.build(:user)
      @another_user.email = @user.email
      @another_user.valid?
      expect(@another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'メールアドレスは、@を含む必要があること。' do
      @user.email = 'testmail'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
    it 'パスワードが必須であること。' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'パスワードは、6文字以上での入力が必須であること' do
      @user.password = '000aa'
      @user.password_confirmation = '000aa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'パスワードは、半角英数字混合での入力が必須であること' do
      @user.password = '000000'
      @user.password_confirmation = '000000'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end
    it 'パスワードとパスワード（確認）は、値の一致が必須であること。' do
      @user.password = '1234aa'
      @user.password_confirmation = '12345aa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")    
    end
    it 'お名前(全角)は、名字と名前がそれぞれ必須であること。' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it 'お名前(全角)は、全角（漢字・ひらがな・カタカナ）での入力が必須であること。' do
      @user.last_name = 'yamada'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid")
      @user.first_name = 'taro'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
    end
    it 'お名前カナ(全角)は、名字と名前がそれぞれ必須であること。' do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end
    it 'お名前カナ(全角)は、全角（カタカナ）での入力が必須であること。' do
      @user.last_name_kana = '山田'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana is invalid")
      @user.first_name_kana = '太郎'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
    end
    it '生年月日が必須であること。' do
      @user.dob = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Dob can't be blank")
    end


  end
end
