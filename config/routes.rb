Rails.application.routes.draw do
  root 'home#index'

  resources :races, except: [:show]
  resources :drivers, except: [:show]
  resources :passengers, except: [:show]

  post '/users/search', to: "users#search", as: :search
  get '/users/search', to: "users#search"

end