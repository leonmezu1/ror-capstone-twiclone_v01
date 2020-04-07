# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'chirps#index'
  get 'users/show'
  devise_for :users
  resources :chirps
  delete '/comments', to: 'comments#destroy', as: 'uncomment'
  delete '/chirps', to: 'chirps#destroy', as: 'deletechirp'

  resources :users do
    resources :followings
  end
  resources :chirps do
    resources :comments
    resources :likes
  end
end
