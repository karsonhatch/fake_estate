Rails.application.routes.draw do
root 'sellers#index'

delete '/address/:id', to: 'addresses#destroy', as: 'address'

  resources :sellers do 
    resources :homes do 
      resources :addresses
    end
  end
end
