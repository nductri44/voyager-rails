Rails.application.routes.draw do
  root to: 'static_pages#home'

  get 'password_resets/new'
  get 'password_resets/edit'

  get '/home', to: 'static_pages#home'
  get '/help', to: 'static_pages#help'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'

  get '/signup', to: 'users#new'
  get '/users/[:id]', to: 'users#show'
  get '/users/[:id]', to: 'users#update'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users
  resources :account_activations, only: :edit
  resources :password_resets, only: %i[new create edit update]
  resources :microposts, only: %i[create destroy]

  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
