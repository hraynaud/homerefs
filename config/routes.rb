Homerefs::Application.routes.draw do
  root :to => 'public#landing'

  resources :reviews

  resources :buildings

  resources :apartments

  resources :users

  #match '/auth/:provider/callback', :to => 'sessions#callback'
  match '/home', to: 'reviews#home'
  match '/auth/:provider/callback', to: 'sessions#create'
  match '/logout', to: 'sessions#destroy', as: 'logout'

end
