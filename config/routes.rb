Rails.application.routes.draw do
  root 'gossips#index'

  resources :gossips

  get '/user/:id', to: 'user#profil', as: 'user'
  get '/welcome/:id', to: 'landing#welcome_user', as:'welcome'
  get '/team', to: 'static#team'
  get '/contact', to: 'static#contact'
end
