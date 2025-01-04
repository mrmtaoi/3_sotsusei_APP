Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  
  # ログイン前後で異なるトップページを表示
  root 'application#top'

  # その他のルート
  get 'signup', to: 'users#new'
  get 'static_pages/top', to: 'static_pages#top'
  get 'static_pages/welcome', to: 'static_pages#welcome'
  get 'stocks/emergency_kits/index', to: 'stocks#emergency_kits#new'

  namespace :stocks do
    resources :stocks
    resources :emergency_kits do
      collection do
        get 'all'  # 'stocks/emergency_kits/all' のパスを設定
      end
    end
  end
end
