Rails.application.routes.draw do
  resources :bookings
  resources :rooms
  resources :admins
  resources :libraryusers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root 'static_pages#home'
  get 'sessions/new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get '/logout', to: 'sessions#destroy'

  get    '/login_admin',   to: 'sessions#adminLogin'
  post   '/login_admin',   to: 'sessions#create_admin'
  delete '/logout_admin',  to: 'sessions#destroy_admin'
  get '/logout_admin', to: 'sessions#destroy_admin'

  get 'static_pages/home'
end
