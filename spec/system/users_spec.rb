require 'rails_helper'

RSpec.describe 'Users', type: :system do
  let(:user) {create :user}

  describe 'ユーザー一覧ページ' do
    it 'パンくずが表示されていること' do 
      visit users_path
      expect(page).to have_content 'Home'
      expect(page).to have_content 'ユーザー一覧'
    end
  end
end