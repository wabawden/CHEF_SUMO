Rails.application.routes.draw do
  root to: 'pages#home'
  resources :bookings, except: [:index, :new]
  resources :chefs
  resources :reviews, only: [:create, :new, :destroy]
  # get 'messages/show'
  devise_for :users
  get 'users/home', to: 'users#home'
  get 'users/:id', to: 'users#show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
