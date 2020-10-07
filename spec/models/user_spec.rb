require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'サインアップ(ウィザード１ページ目)' do
    before do
      @user = FactoryBot.build(:user)
    end

    context '入力情報に問題なく、2ページ目へ遷移できる時' do
      it '必須情報が全て入力されていれば２ページ目に遷移できる' do
        expect(@user).to be_valid
      end
    end

    context '入力情報に問題があり、2ページ目へ遷移できなき時' do
      it '生年月日が未入力の場合は遷移できない' do
        @user.birthday = '---------'
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end

      it 'メールアドレスが未入力の場合は遷移できない' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'パスワードが未入力の場合は遷移できない' do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it '確認用パスワードが未入力の場合は遷移できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'メールアドレスが重複している場合は遷移できない' do
        @user.save
        @user2 = FactoryBot.build(:user, email: @user.email)
        @user2.valid?
        expect(@user2.errors.full_messages).to include('Email has already been taken')
      end

      it 'メールアドレスに＠が抜けている場合は遷移できない' do
        @user.email = 'test.esample.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'パスワードが5文字以下の場合は遷移できない' do
        @user.password = 'test1'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'パスワードが半角英字だけの場合は遷移できない' do
        @user.password = 'testab'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password 半角英数字のみ及び英字、数字の両方が必要です')
      end

      it 'パスワードが半角数字だけの場合は遷移できない' do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password 半角英数字のみ及び英字、数字の両方が必要です')
      end
    end
  end
end
