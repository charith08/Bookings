Rails.application.routes.draw do


  resources :pusers
  resources :participants
  resources :bookings
  resources :rooms

  resources :rooms do
        resources :bookings do
          resources :participants
        end
  end


  resources :users do
        resources :bookings
  end

  resources :users do
    resources :pusers
    end

  get '/adduser', to: 'participants#new'
  get '/show_booking_users', to: 'participants#show'
  get '/show_user_bookings', to: 'pusers#show'
  get '/addparticipant', to: 'participants#new'
  post '/addparticipant', to: 'participants#create'
  get 'password_resets/new'
  get 'password_resets/edit'
  get '/response_yes', to: 'pusers#yes'
  get '/response_no', to: 'pusers#no'
  root 'static_pages#home'
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/signup',  to: 'users#new'
  #post '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  #get '/activate',   to: 'account_activations#activate'
  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
