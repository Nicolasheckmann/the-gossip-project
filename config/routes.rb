Rails.application.routes.draw do
  root 'static#home'

  get '/user/:id', to: 'user#profil', as: 'user'
  get '/gossip/:id', to: 'gossip#content', as: 'gossip'
  get '/welcome/:id', to: 'landing#welcome_user', as:'welcome'
  get '/team', to: 'static#team'
  get '/contact', to: 'static#contact'
end
