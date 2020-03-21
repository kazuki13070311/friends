# == Schema Information
#
# Table name: friends
#
#  id          :bigint           not null, primary key
#  description :text(65535)
#  model       :string(255)
#  name        :string(30)       not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#
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
