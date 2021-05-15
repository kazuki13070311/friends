# frozen_string_literal: true

Rails.application.routes.draw do
  get 'posts/index'
  get 'posts/show'
  get 'posts/ranking'
  root to: 'homes#home'

  resources :users, only: %i[index new edit update]

  resources :relationships, only: %i[create destroy]

  resources :friends do
    resources :comments,only: [:create,:destroy]
  end
  
  resources :posts, only: %i[index show create destroy new edit update]
  post 'posts/new', to: 'posts#create'

  resources :posts, only: %i[index show create] do
    resources :likes, only: %i[create destroy]
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

  get 'users/:id/friend', to: 'users#friend'
  get 'users/:id/post', to: 'users#post'
  get 'users/:id/like', to: 'users#like'
  get 'users/:id/admin', to: 'users#admin'
  get 'homes/term'
  get 'homes/privacy'
  get 'homes/sitenav'

  resources :users do
    member do
      get :following, :followers
    end
  end

  resources :notifications, only: :index do
    collection do
      delete 'destroy_all'
    end
  end

  resources :microposts

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end