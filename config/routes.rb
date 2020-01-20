Rails.application.routes.draw do
  
  root to: "home#home"
  resources :users, :only => [:index,:new,:edit,:update]
  resources :friends
  
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  }

  devise_scope :user do
    get "users/:id", :to => "users#show"
    get "signup", :to => "users/registrations#new"
    get "login", :to => "users/sessions#new"
    get "logout", :to => "users/sessions#destroy"
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end