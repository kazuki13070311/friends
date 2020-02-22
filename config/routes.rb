# frozen_string_literal: true

Rails.application.routes.draw do
  get 'posts/index'
  get 'posts/show'
  root to: 'home#home'

  resources :users, only: %i[index new edit update]

  resources :friends
  resources :posts, only: [:index,:show,:create,:destroy]

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
  end

  get 'search', to: 'friends#search'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end