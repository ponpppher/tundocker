# frozen_string_literal: true

Rails.application.routes.draw do
  # callback routing
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  resources :users, only: [:show]

  unauthenticated :users do
    # landing page
    root to: 'homes#index', as: :root #-> if user is not logged in
  end

  resources :books do
    resources :articles, except: :index do
      resources :comments, only: [:create, :destroy]
    end
  end

  resources :recommends
  resources :article_favs, only: [:create, :destroy]
  resources :recommend_favs, only: [:create, :destroy]
  resources :groups, only: [:create, :destroy]
  resources :regist_books, only: [:create, :destroy]
  resources :tags, only: [:new, :create, :destroy]

  # set letter opener
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
