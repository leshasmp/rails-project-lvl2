# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  scope module: :web do
    root 'home#index'
    resources :posts, only: [:index, :show, :new, :create] do
      scope module: :posts do
        resources :comments, only: [:create]
        resources :likes, only: [:create, :destroy]
      end
    end
  end
end
