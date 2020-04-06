# frozen_string_literal: true

Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  root to: 'chirps#index'
end
