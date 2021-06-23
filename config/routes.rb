Rails.application.routes.draw do
   namespace :api do
    namespace :v1 do
      get 'campaigns/index', to: 'campaigns#index'
      post 'campaigns/create', to: 'campaigns#create'
      get '/show/:id', to: 'campaigns#show'
      delete 'destroy/:id', to: 'campaigns#destroy'
      
      resources :users, only: [:index, :create, :show] 
      post '/login', to: 'auth#create'
      get '/login', to: 'users#token_authenticate'
      get '/profile', to: 'users#profile'
      get '/api/v1/users', to: 'users#show'
      post '/api/v1/users', to: 'users#create'

     
    end
  end

  root 'homepage#index'

end
