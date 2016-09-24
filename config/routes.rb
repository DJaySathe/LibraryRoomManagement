Rails.application.routes.draw do
  resources :bookings
  resources :rooms
  root 'users#index'
  resources :users
  get 'opensearch' => 'rooms#opensearch', :as => :opensearch
  get 'search_rooms' => 'rooms#search', :as => :search_rooms
  get 'book_room' => 'rooms#book', :as => :book_room
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
