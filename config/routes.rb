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

  resources :books
  resources :articles
  resources :reccomends

  resources :tags, only: [:new, :create, :destroy]
end
