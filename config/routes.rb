Rails.application.routes.draw do
  root 'gossips#index'

  resources :gossips do
    resources :comments
    resources :likes, only: [:create, :destroy]
  end
  resources :users
  resources :cities
  resources :sessions, only: [:new, :create, :destroy]
  

  get '/welcome/:id', to: 'landing#welcome_user', as:'welcome'
  get '/team', to: 'static#team'
  get '/contact', to: 'static#contact'
end
