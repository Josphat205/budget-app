# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root "groups#index"
  resources :groups, only: [:index, :show, :new, :create, :destroy] do
    resources :expenses, only: [:index]
  end

  resources :expenses, only: [:new, :create, :destroy]
end
