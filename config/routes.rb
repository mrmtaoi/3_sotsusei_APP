Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  
  root 'static_pages#top'
  get 'static_pages/top', to: 'static_pages#top', as: 'static_pages_top'
  get 'static_pages/welcome', to: 'static_pages#welcome'
  get 'signup', to: 'users#new'

  resources :users, only: [:show]
  
  namespace :stocks do
    resources :stocks, only: [:index, :show, :new, :create, :edit, :update, :destroy]
    resources :emergency_kits, only: [:index, :show, :create, :edit, :update, :destroy, :new] do
      collection do
        get 'all'
      end
      resources :kit_items, only: [:index, :create, :edit, :update, :destroy] do
      end
    end
  end  
end
