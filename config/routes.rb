# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  scope module: :web do
    root 'home#index'
    resources :posts, only: %i[index show new create] do
      scope module: :posts do
        resources :comments, only: %i[create]
        resources :likes, only: %i[create destroy]
      end
    end
  end
end
