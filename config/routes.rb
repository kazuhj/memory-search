Rails.application.routes.draw do
  devise_for :users
  root 'groups#index'

  resources :users, only: [:edit, :update]
  resources :groups, only: [:index, :new, :create, :edit, :update] do
    resources :contents, only: [:index, :new, :create, :show, :destroy, :edit, :update]
    resources :mypages, only: [:index]
  end
end
