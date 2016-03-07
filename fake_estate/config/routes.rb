Rails.application.routes.draw do

  root 'home#index'
 get '/signup', to: 'users#new', as: 'signup'
 get '/login', to: 'sessions#new', as: 'login'
 get '/logout', to: 'sessions#destroy', as: 'logout'


 post '/signup', to: 'users#create'
 post '/login', to: 'sessions#create'

 resources :users
 resources :home
 resources :accounts


 delete '/address/:id', to: 'addresses#destroy', as: 'address'

  resources :sellers do 
    resources :homes do 
      resources :addresses
    end
  end
end
