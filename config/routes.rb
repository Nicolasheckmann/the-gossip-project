Rails.application.routes.draw do
  root 'gossips#index'

  resources :gossips do
    resources :comments, excepts: [:show, :index]
    resources :likes, only: [:create, :destroy]
  end
  resources :users, only: [:show, :new, :create]
  resources :cities, only: [:show]
  resources :sessions, only: [:new, :create, :destroy]
  

  get '/welcome/:id', to: 'landing#welcome_user', as:'welcome'
  get '/team', to: 'static#team'
  get '/contact', to: 'static#contact'
end
