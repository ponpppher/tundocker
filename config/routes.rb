# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'homes#index'
  get 'homes/show'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
end
