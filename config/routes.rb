Rails.application.routes.draw do
  resources :bookings
  resources :rooms
  root 'users#index'
  resources :users
  get 'opensearch' => 'rooms#opensearch', :as => :opensearch
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
