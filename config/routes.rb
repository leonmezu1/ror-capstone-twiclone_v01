# frozen_string_literal: true

Rails.application.routes.draw do
  get 'static/feature'
  get 'static/next', as: 'next'
  root to: 'chirps#index'

  devise_for :users, controllers: { registrations: 'registrations' }
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
