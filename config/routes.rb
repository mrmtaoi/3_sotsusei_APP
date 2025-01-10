Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  
  root 'static_pages#top'
  get 'static_pages/top', to: 'static_pages#top', as: 'static_pages_top'
  get 'static_pages/welcome', to: 'static_pages#welcome'

  get 'signup', to: 'users#new'
  get 'stocks/emergency_kits/index', to: 'stocks#emergency_kits#new'
  get 'stocks/stocks/index', to: 'stocks#stocks#new'

  resources :users, only: [:show]
  
  namespace :stocks do
    resources :stocks
    resources :emergency_kits do
      collection do
        get 'all'
      end
    end
  end
end
