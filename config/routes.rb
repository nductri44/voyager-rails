Rails.application.routes.draw do
  get 'static_pages/home', to: 'static_pages#home'
  get '/signup', to: 'users#new'
  get '/users/[:id]', to: 'users#show'
  resources :users
end
