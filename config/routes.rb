Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  #root 'welcome#home'

  get 'about', to: 'static#about'

  get '/owners/:id', to: 'owners#show', as: 'owner'

  get '/ferrets/:id', to: 'ferrets#show', as: 'ferret'

  get '/opportunities/:id', to: 'opportunities#show', as: 'opportunity'



  resources :ferrets, only: [:index, :new, :create, :edit, :update]
  
  resources :owners, only: [:index, :show]

  resources :opportunities, only: [:index, :new, :create, :edit, :update]

  patch '/opportunities/:id', to: 'opportunities#update'
  




end