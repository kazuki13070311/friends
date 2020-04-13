require 'rails_helper'

RSpec.describe "募集投稿のリクエストテスト", type: :request do
    describe 'GET #index' do
        before do
            get friends_path
        end
    
        it 'リクエストが成功すること' do
            expect(response.status).to eq 200  
        end
    end

    describe 'GET #show' do
        before do
            friend = create(:friend)
            get '/friends'
        end

        it 'リクエストが成功すること' do
            expect(response.status).to eq 200
        end
    end

    describe 'GET #new' do
        context 'ログインしていない場合' do
            it 'リダイレクトされること' do
                get '/friends/new'
                expect(response.status).to eq 302  
            end
        end

        describe 'ログインしている場合' do
            before do
                user1 = create(:user1)
                sign_in user1
            end

            it 'リクエストが成功すること' do
                get '/friends/new'
                expect(response.status).to eq 200 
            end
        end
    end

    describe 'GET #edit' do
        before do
            @user1 = create(:user1)
            @user2 = create(:user2)
            @friend = create(:friend,user: @user1)
        end

        context 'ログインしていない場合' do
            before do
                get edit_friend_path(@friend)
            end

            it 'リダイレクトされること' do
                expect(response.status).to eq 302
            end
        end

        context '募集投稿したユーザー意外でログインしている場合' do
            before do
                sign_in @user2
                get edit_friend_path(@friend)
            end

            it 'リダイレクトされること' do
                expect(response.status).to eq 302
            end
        end

        context "募集投稿したユーザーでログインしている場合" do
            before do
                sign_in @user1
                get edit_friend_path(@friend)
            end

            it 'リクエストが成功すること' do
               expect(response.status).to eq 200 
            end

            it '募集投稿の機種が表示されていること' do
                expect(response.body).to include 'PS4'
            end

            it '募集投稿の募集内容が表示されていること' do
                expect(response.body).to include 'フレンド募集'
            end

            it '募集投稿の詳細が表示されていること' do
                expect(response.body).to include '詳細を記入'
            end
        end
    end

    describe 'POST #create' do
        context 'パラメータが妥当な場合'do
            before do
                user1 = create(:user1)
                sign_in user1
                post friends_url, params:{friend: attributes_for(:friend,user: user1)}
            end

            it 'リクエストが成功すること' do
                expect(response.status).to eq 302
            end

            it '募集投稿が作成されていること' do
                expect(Friend.last.name).to eq 'フレンド募集'
            end
        end
    end
end
