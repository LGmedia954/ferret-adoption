Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  # Some of the following could be refactored.
  # I am writing them out full for now.

  get 'about', to: 'static#about'

  #get "/ferrets" => 'ferrets#index', as => :ferrets
  
  #get "/owners" => 'owners#index', as => :owners

  #get "/opportunities" => 'opportunities#index', as => :opportunities
  
  
  #get 'opportunities/:id', to: 'opportunities#show'


end