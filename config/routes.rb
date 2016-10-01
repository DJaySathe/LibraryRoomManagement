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
  get '/static_pages_aboutus', to: 'static_pages#aboutus'
  get '/static_pages_contactus', to: 'static_pages#contactus'

  get    '/login_admin',   to: 'sessions#adminLogin'
  post   '/login_admin',   to: 'sessions#create_admin'
  delete '/logout_admin',  to: 'sessions#destroy_admin'
  get '/logout_admin', to: 'sessions#destroy_admin'

  get '/destroy_booking/:id', to: 'bookings#destroy', as: 'destroy_booking'

  get '/destroy_libraryuser/:id', to: 'libraryusers#destroy', as: 'destroy_libraryuser'

  get '/admin/:id', to: 'admins#destroy', as: 'destroy_admin'

  get 'static_pages/home'
end
