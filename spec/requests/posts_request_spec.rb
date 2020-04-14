require 'rails_helper'

RSpec.describe "自慢の一枚投稿のリクエストテスト", type: :request do
    describe "GET #index" do
        before do
            get posts_path
        end

        it '投稿一覧ページが表示される' do
            expect(response.status).to eq 200  
        end
    end

    describe 'GET #show' do
        before do
            get "/posts"
        end

        it '投稿詳細ページが表示される' do
            expect(response.status).to eq 200  
        end
    end

    describe 'GET #ranking' do
        before do
            get '/posts/ranking'
        end

        it 'ランキング一覧画面が表示される' do
            expect(response.status).to eq 200 
        end
    end

    describe 'GET #edit' do
        before do
            @user1 = create(:user1)
            @user2 = create(:user2)
            @post = create(:post,user: @user1)
        end

        context 'ログインしていない場合' do
            before do
                get edit_post_path(@post)
            end

            it 'リダイレクトされること' do
                expect(response.status).to eq 302  
            end
        end

        context '投稿したユーザーでログインしている場合' do
            before do
                sign_in @user1
                get edit_post_path(@post)
            end
            
            it 'リクエストが成功すること' do
                expect(response.status).to eq 200
            end
            
            it '投稿タイトルが表示されていること' do
                expect(response.body).to include 'テストタイトル'
            end

            it '説明詳細が表示されていること' do
                expect(response.body).to include 'この投稿はテスト投稿です'
            end
        end
    end

    describe 'POST #create' do
        context 'パラメータが妥当な場合' do
            before do
                user1 = create(:user1)
                sign_in user1
                post "/posts/new", params:{post: attributes_for(:post,user: user1)}
            end

            it 'リクエストが成功すること' do
                expect(response.status).to eq 200
            end

            #it '自慢の一枚投稿が作成されていること' do
            #    expect(Post.last.content).to eq 'テストタイトル'
            #end
        end
    end
end
