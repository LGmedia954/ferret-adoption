Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  # Some of the following may be refactored.
  # I am writing them out full for now.

  #root 'welcome#home'

  get 'about', to: 'static#about'

  resources :ferrets, only: [:index, :new, :create]
  get '/ferrets/:id', to: 'ferrets#show', as: 'ferret'

  #get "/owners" => 'owners#index', as => :owners
  resources :owners, only: [:index, :show]

  resources :opportunities, only: [:index, :new, :create]
  get '/opportunities/:id', to: 'opportunities#show', as: 'opportunity'




end