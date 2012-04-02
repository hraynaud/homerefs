Homerefs::Application.routes.draw do

  resources :apartments

  root :to => 'public#landing'

  match '/auth/:provider/callback', :to => 'sessions#callback'

end
