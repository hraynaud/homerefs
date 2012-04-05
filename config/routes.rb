Homerefs::Application.routes.draw do

  resources :reviews

  resources :buildings

  resources :apartments

  root :to => 'public#landing'

  match '/auth/:provider/callback', :to => 'sessions#callback'

end
