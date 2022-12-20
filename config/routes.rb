Rails.application.routes.draw do
  devise_for :users
  root 'groups#index'
  resources :groups, only: %i[index show new create destroy] do
    resources :expenses, only: [:index]
  end

  resources :expenses, only: %i[new create destroy]
end
