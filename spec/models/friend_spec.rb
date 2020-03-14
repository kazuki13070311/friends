require 'rails_helper'

RSpec.describe Friend, type: :model do
  describe 'バリデーションのテスト' do

    context '入力欄が空白の時' do
      let(:friend){Friend.new}

      it 'エラーになる' do
        expect(friend.valid?).to eq(false)
        expect(friend.errors.messages[:name]).to include('を入力してください')
      end
    end
  end
end
