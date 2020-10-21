require 'rails_helper'

RSpec.describe Profile, type: :model do
  describe 'サインアップウィザード２ページ目(プロフィール登録)' do
    before do
      @profile = FactoryBot.build(:profile)
    end

    context '登録が正常に完了する' do
      it 'nicknameが入力されていれば登録できる' do
        expect(@profile).to be_valid
      end
    end

    context '登録できない' do
      it 'nicknameが未入力の場合は登録できない' do
        @profile.nickname = nil
        @profile.valid?
        expect(@profile.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'nicknameが半角英数字以外の場合は登録できない' do
        @profile.nickname = 'テストニックネーム'
        @profile.valid?
        expect(@profile.errors.full_messages).to include('Nickname 半角英数字のみ利用可能です')
      end

      it 'nicknameが3文字以下の場合は登録できない' do
        @profile.nickname = 'tes'
        @profile.valid?
        expect(@profile.errors.full_messages).to include('Nickname is too short (minimum is 4 characters)')
      end

      it 'nicknameが16文字以上の場合は登録できない' do
        @profile.nickname = 'test1test2test3t'
        @profile.valid?
        expect(@profile.errors.full_messages).to include('Nickname is too long (maximum is 15 characters)')
      end

      it 'nicknameが重複する場合は登録できない' do
        @profile.save
        @profile2 = FactoryBot.build(:profile, nickname: @profile.nickname)
        @profile2.valid?
        expect(@profile2.errors.full_messages).to include('Nickname has already been taken')
      end
    end
  end
end
