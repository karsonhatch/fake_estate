Rails.application.routes.draw do
  get 'user/index'

  get 'user/show'

  get 'user/new'

  get 'user/update'

root 'sellers#index'

delete '/address/:id', to: 'addresses#destroy', as: 'address'

  resources :sellers do 
    resources :homes do 
      resources :addresses
    end
  end
end
