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
  get 'opensearch' => 'rooms#opensearch', :as => :opensearch
  get 'search_rooms' => 'rooms#search', :as => :search_rooms
  get 'book_room' => 'rooms#book', :as => :book_room
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
