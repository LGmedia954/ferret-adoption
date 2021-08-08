Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  # Some of the following could be refactored.
  # I am writing them out full for now.

  #root 'welcome#home'

  get 'about', to: 'static#about'

  #get "/ferrets" => 'ferrets#index', as => :ferrets
  resources :ferrets, only: [:index, :show]

  #get "/owners" => 'owners#index', as => :owners
  resources :owners, only: [:index, :show]

  #get "/opportunities" => 'opportunities#index', as => :opportunities
  resources :opportunities, only: [:index, :show]




end