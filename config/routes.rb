Rails.application.routes.draw do
  root 'gossips#index'

  resources :gossips
  resources :users
  resources :cities

  get '/welcome/:id', to: 'landing#welcome_user', as:'welcome'
  get '/team', to: 'static#team'
  get '/contact', to: 'static#contact'
end
