Rails.application.routes.draw do
  resources :bookings
  resources :rooms
  resources :admins
  resources :libraryusers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root 'rooms#index'
  get 'sessions/new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get '/logout', to: 'sessions#destroy'
  
  get 'static_pages/home'
end
