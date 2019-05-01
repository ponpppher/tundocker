# frozen_string_literal: true

Rails.application.routes.draw do
  # root to: 'homes#index'
  get 'homes/show'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  # authenticated :users do
  #   root to: 'homes#shows', as: :root
  # end

  unauthenticated :users do
    root to: 'homes#index', as: :unathenticated #-> if user is not logged in
  end
end
