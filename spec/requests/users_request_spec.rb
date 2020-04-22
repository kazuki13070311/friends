# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'ユーザーのリクエストテスト', type: :request do
  describe 'GET #index' do
    before do
      create(:user1)
      create(:user2)
      get users_path
    end

    it 'リクエストが成功すること' do
      expect(response.status).to eq 200
    end

    it 'user名が表示されること' do
      expect(response.body).to include 'テストユーザー1'
      expect(response.body).to include 'テストユーザー2'
    end
  end

  describe 'GET #show' do
    describe 'ユーザーが存在する場合' do
      before do
        user1 = create(:user1)
        get user_url user1.id
      end

      it 'リクエストが成功すること' do
        expect(response.status).to eq 200
      end

      it 'ユーザー名が表示されていること' do
        expect(response.body).to include 'テストユーザー1'
      end
    end
  end

  describe 'GET #new' do
    it 'リクエストが成功すること' do
      get new_user_registration_path
      expect(response.status).to eq 200
    end
  end

  describe 'GET #edit' do
    before do
      user1 = create(:user1)
      sign_in user1
      get edit_user_registration_path
    end

    it 'リクエストが成功すること' do
      expect(response.status).to eq 200
    end

    it 'ユーザー名が表示されていること' do
      expect(response.body).to include 'テストユーザー1'
    end

    it 'メールアドレスが表示されていること' do
      expect(response.body).to include 'test1@gmail.com'
    end
  end

  describe 'POST #create' do
    describe 'パラメータが妥当な場合' do
      before do
        post user_registration_path, params: { user: attributes_for(:user1) }
      end

      it 'リクエストが成功すること' do
        expect(response.status).to eq 302
      end

      it 'ユーザーが登録されること' do
        expect(User.last.name).to eq 'テストユーザー1'
      end

      it 'リダイレクトすること' do
        expect(response).to redirect_to User.last
      end
    end
  end

  describe 'PUT #update' do
    describe 'パラメータが妥当な場合' do
      before do
        @user1 = create(:user1)
        sign_in @user1
        put user_registration_path, params: { user: attributes_for(:user2).merge(current_password: 'password') }
      end

      it 'リクエストが成功すること' do
        expect(response.status).to eq 302
      end

      it 'ユーザー名が更新されること' do
        expect(User.last.name).not_to eq 'user1'
      end

      it 'リダイレクトすること' do
        expect(response).to redirect_to User.last
      end
    end
  end
end
