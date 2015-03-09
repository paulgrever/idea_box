Rails.application.routes.draw do
  resources :ideas
  resources :categories
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  root "sessions#new"
  
  resources :users 

end
