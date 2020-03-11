# frozen_string_literal: true

Rails.application.routes.draw do
  get 'posts/index'
  get 'posts/show'
  get 'posts/ranking'
  root to: 'home#home'

  resources :users, only: %i[index new edit update]

  resources :friends
  resources :posts, only: [:index,:show,:create,:destroy,:new,:edit,:update]
    post 'posts/new', to: 'posts#create'
  
  resources :posts, only: [:index, :show, :create] do
    resources :likes, only:[:create, :destroy]
  end
  
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  devise_scope :user do
    get 'users/:id', to: 'users#show'
    get 'signup', to: 'users/registrations#new'
    get 'login', to: 'users/sessions#new'
    get 'logout', to: 'users/sessions#destroy'
    get 'logout/:id', to: 'users#destroy'
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end

  get 'search', to: 'friends#search'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end