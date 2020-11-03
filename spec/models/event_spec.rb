require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'イベント作成' do
    before do
      @event = FactoryBot.build(:event)
    end

    context 'イベント作成できる時' do
      it '正しく入力されている場合イベントが作成できる' do
        expect(@event).to be_valid
      end
    end

    context 'イベントが作成できない時' do
      it 'titleが空の場合は作成できない' do
        @event.title = nil
        @event.valid?
        expect(@event.errors.full_messages).to include("Title can't be blank")
      end

      it 'dateがからの場合は作成できない' do
        @event.date = nil
        @event.valid?
        expect(@event.errors.full_messages).to include("Date can't be blank")
      end

      it 'prefecture_idが未選択(0)の場合は作成できない' do
        @event.prefecture_id = 0
        @event.valid?
        expect(@event.errors.full_messages).to include('Prefecture is not selected')
      end

      it 'meeting_pointがからの場合は作成できない' do
        @event.meeting_point = nil
        @event.valid?
        expect(@event.errors.full_messages).to include("Meeting point can't be blank")
      end

      it 'detailsがからの場合は作成できない' do
        @event.details = nil
        @event.valid?
        expect(@event.errors.full_messages).to include("Details can't be blank")
      end

      it 'meetup_timeからの場合は作成できない' do
        @event.meetup_time = nil
        @event.valid?
        expect(@event.errors.full_messages).to include("Meetup time can't be blank")
      end
    end
  end
end
