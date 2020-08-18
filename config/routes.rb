Rails.application.routes.draw do
  root to: 'pages#home'
  resources :bookings, except: [:index, :new]
  resources :chefs
  resources :reviews, only: [:create, :destroy]
  # get 'messages/show'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
