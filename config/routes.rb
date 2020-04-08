# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'chirps#index'
  get 'users/show'

  devise_for :users
  resources :chirps

  post 'followings/create', to: 'followings#create', as: 'follow'

  delete '/comments', to: 'comments#destroy', as: 'uncomment'
  delete '/chirps', to: 'chirps#destroy', as: 'deletechirp'
  delete '/followings/destroy', to: 'followings#destroy', as: 'unfollow'

  resources :users do
    resources :followings
  end
  resources :chirps do
    resources :comments
    resources :likes
  end
end
