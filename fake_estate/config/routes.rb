Rails.application.routes.draw do
roots 'sellers#index'

  resouces :sellers do 
    resouces :homes do 
      resources :addresses
    end
  end
end
