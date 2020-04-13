require 'rails_helper'

RSpec.describe "Friend", type: :request do
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
        describe 'ログインしていない場合' do
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
end
