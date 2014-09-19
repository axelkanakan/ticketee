Rails.application.routes.draw do

 
  namespace :admin do
   root :to => "base#index"
   resources :users
  end

  root "projects#index"

  get "/signin", to: "sessions#new"

  post "/signin", to: "sessions#create"

  resources :users
  
  resources :projects do 
  	resources :tickets
  end
end
