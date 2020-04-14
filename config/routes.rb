Rails.application.routes.draw do
  devise_for :users
  root 'groups#index'

  resources :users, only: [:show, :edit, :update]
  resources :groups, only: [:index, :new, :create, :edit, :update] do
    resources :contents, only: [:index, :new, :create, :show, :destroy, :edit, :update] do
      collection do
        get 'search'
      end
    end
    resources :mypages, only: [:index]
  end
end
