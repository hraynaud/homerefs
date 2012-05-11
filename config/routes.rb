Homerefs::Application.routes.draw do
  # get "errors/error_404"
  # get "errors/error_500"

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
  match '/about', to: 'public#about_us'
  match '/how-it-works', to: 'public#how_it_works'
  match '/faq', to: 'public#faq'
  match '/contact', to: 'public#contact'
  match '/auth/:provider/callback', to: 'sessions#create'
  match "/auth/failure", to: "sessions#failure"
  match '/login', to: 'sessions#new', as: 'login'
  match '/logout', to: 'sessions#destroy', as: 'logout'
  match '/search', to: 'buildings#search'

  unless Rails.application.config.consider_all_requests_local
    match '*not_found', to: 'errors#error_404'
  end

end
