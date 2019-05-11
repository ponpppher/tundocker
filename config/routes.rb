# frozen_string_literal: true

Rails.application.routes.draw do
  # callback routing
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  # default root path
  root to: 'books#index'

  resources :users, only: [:show]

  unauthenticated :users do
    # landing page
    root to: 'homes#index', as: :unauthenticated #-> if user is not logged in
  end

  resources :books do
    resources :articles do
      resources :comments, only: [:create, :destroy]
    end
  end

  resources :article_favs, only: [:create, :destroy]

  resources :reccomends
  resources :regist_books, only: [:destroy]

  resources :tags, only: [:new, :create, :destroy]
end
