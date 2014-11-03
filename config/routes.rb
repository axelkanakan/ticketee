Rails.application.routes.draw do

 resources :files
  
  namespace :admin do
   root :to => "base#index"
    resources :users do 
      resources :permissions

      put "permissions", to: "permissions#set", 
                         as: "set_permissions"
    end

    resources :states do 
      member do 
        get :make_default
      end
    end
  end

  delete "/signout", to: "sessions#destroy", as: "signout"

  root "projects#index"

  get "/signin", to: "sessions#new"

  post "/signin", to: "sessions#create"

  resources :users
  
  resources :projects do 
  	resources :tickets
  end

  resources :tickets do
    resources :comments
  end
end
