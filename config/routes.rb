# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'chirps#index'
  devise_for :users, controllers: { registrations: 'registrations' }
  resources :chirps, only: %i[index create destroy]
  get 'static/feature'
  get 'static/next', as: 'next'
  get 'static/help', as: 'help'

  post 'followings/create', to: 'followings#create', as: 'follow'
  delete '/followings/destroy', to: 'followings#destroy', as: 'unfollow'

  delete '/comments', to: 'comments#destroy', as: 'uncomment'
  delete '/chirps', to: 'chirps#destroy', as: 'deletechirp'

  resources :users do
    resources :followings, only: %i[create destroy]
  end
  resources :chirps do
    resources :comments, only: %i[create destroy]
    resources :likes, only: %i[create destroy]
  end
end
