Homerefs::Application.routes.draw do
  resources :feedbacks

  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  root :to => 'public#landing'

  resources :reviews

  resources :apartments

  resources :buildings

  resources :users

  resources :identities

  match '/home', to: 'reviews#home'
  match '/auth/:provider/callback', to: 'sessions#create'
  match "/auth/failure", to: "sessions#failure"
  match '/login', to: 'sessions#new', as: 'login'
  match '/logout', to: 'sessions#destroy', as: 'logout'
  match '/search', to: 'buildings#search'
  match '/results', to: 'buildings#results'

end
