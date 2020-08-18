Rails.application.routes.draw do
  root to: 'pages#home'
  resources :bookings, except: [:index, :new]
  resources :chefs
  resources :reviews, only: [:create, :destroy]
  # get 'messages/show'
  get 'users/home', to: 'users#home'
  get 'users/:id', to: 'users#show'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
