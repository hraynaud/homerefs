Homerefs::Application.routes.draw do


  root :to => 'public#landing'

  match '/auth/:provider/callback', :to => 'sessions#callback'

end
