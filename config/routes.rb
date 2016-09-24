Rails.application.routes.draw do
  get 'sessions/new'

  get 'static_pages/home'

  resources :bookings
  resources :rooms
  root 'sessions#new'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  get '/logout', to: 'sessions#destroy'

  get    '/signup',  to: 'users#new'

  get '/user/show',  to: 'users#show'  

  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
