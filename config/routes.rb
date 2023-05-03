Rails.application.routes.draw do
  get 'sessions/new'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: 'home#top'

  #ユーザー用のルート設定（"users#new"のパスのみ rootのURL/signup としたい）
  get "signup", to: "users#new"
  resources :users, except: [:new]

  # Session用のルートティングを設定
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
end
