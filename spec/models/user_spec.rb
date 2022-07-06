require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe 'ユーザー新規登録' do
    # it 'nicknameが空では登録できない' do
    #   user = User.new(nickname: '', email: 'test@example', password: '000000', password_confirmation: '000000')
    #   user.valid?
    #   expect(user.errors.full_messages).to include("Nickname can't be blank")
    # end
    it 'ニックネームが必須であること。' do
      # nicknameが空では登録できないテストコードを記述します
      user = User.new(nickname: '', email: 'test@example', encrypted_password: '000000', 
        password_confirmation: '000000',last_name:'',first_name:'',last_name_kana:'',first_name_kana:'',dob:DateTime.now)
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'メールアドレスが必須であること。' do
      # emailが空では登録できないテストコードを記述します
    end
    it 'メールアドレスが一意性であること。' do
      # emailが空では登録できないテストコードを記述します
    end
    it 'メールアドレスは、@を含む必要があること。' do
      # emailが空では登録できないテストコードを記述します
    end
    it 'パスワードが必須であること。' do
      # emailが空では登録できないテストコードを記述します
    end
    it 'パスワードは、6文字以上での入力が必須であること' do
      # emailが空では登録できないテストコードを記述します
    end
    it 'パスワードは、半角英数字混合での入力が必須であること' do
      # emailが空では登録できないテストコードを記述します
    end
    it 'パスワードとパスワード（確認）は、値の一致が必須であること。' do
      # emailが空では登録できないテストコードを記述します
    end
    it 'お名前(全角)は、名字と名前がそれぞれ必須であること。' do
      # emailが空では登録できないテストコードを記述します
    end
    it 'お名前(全角)は、全角（漢字・ひらがな・カタカナ）での入力が必須であること。' do
      # emailが空では登録できないテストコードを記述します
    end
    it 'お名前カナ(全角)は、名字と名前がそれぞれ必須であること。' do
      # emailが空では登録できないテストコードを記述します
    end
    it 'お名前カナ(全角)は、全角（カタカナ）での入力が必須であること。' do
      # emailが空では登録できないテストコードを記述します
    end
    it '生年月日が必須であること。' do
      # emailが空では登録できないテストコードを記述します
    end


  end
end
