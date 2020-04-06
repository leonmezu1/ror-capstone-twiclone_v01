# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'chirps#index'
  get 'users/show'
  devise_for :users
  resources :chirps

  resources :users  do
    resources :followings
  end
  resources :chirps do
    resources :comments
    resources :likes
  end
end
