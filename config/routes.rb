Rails.application.routes.draw do
  get 'diaries/index'
  get 'diaries/create'
  get 'diaries/new'
  get 'diaries/edit'
  get 'diaries/update'
  get 'diaries/destroy'
  get 'diaries/show'

  get 'turning_points/index'
  get 'turning_points/edit'
  get 'turning_points/update'
  get 'turning_points/destroy'

  get 'sessions/new'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: 'home#top'

  #ユーザー用のルート設定（"users#new"のパスのみ rootのURL/signup としたい）
  get "signup", to: "users#new"
  resources :users, except: [:new]

  resources :diaries
  resources :turning_points

  # Session用のルートティングを設定
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
end
