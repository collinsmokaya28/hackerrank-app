Rails.application.routes.draw do
  
  resources :questions
  resources :answers
  resources :users, only: [:index]
  # Routing logic: fallback requests for React Router.
  # Leave this here to help deploy your app later!
  get "*path", to: "fallback#index", constraints: ->(req) { !req.xhr? && req.format.html? }

  post '/signup', to: 'users#create' #for signup requests

  get '/me', to: 'users#show' #for authenticate requests

  #login
  post '/login', to: 'sessions#create' #for login requests

  #logout
   delete '/logout', to: 'sessions#destroy' #for logout requests
end
