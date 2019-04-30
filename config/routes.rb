# frozen_string_literal: true

Rails.application.routes.draw do
  # landing page
  root to: "homes#index"
  
  resources :books
  resources :articles
  resources :reccomends

  resources :tags, only: %i[new create destroy]
end
