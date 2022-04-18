# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  scope module: :web do
    root 'home#index'
    resources :posts do
      scope module: :posts do
        resources :comments
      end
    end
  end
end
