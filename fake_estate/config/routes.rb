Rails.application.routes.draw do
root 'sellers#index'

  resources :sellers do 
    resources :homes do 
      resources :addresses
    end
  end
end
