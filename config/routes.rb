Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'static#home'

  get 'owners/new', to: 'owners#new', as: 'signup'

  get '/sessions/new', to: 'sessions#new', as: 'login'
  
  post '/sessions/create', to: 'sessions#create'

  delete '/sessions/destroy', to: 'sessions#destroy', as: 'logout'


  get '/welcome/home', to: 'welcome#home'

  get 'about', to: 'static#about'


  #resources :owners do
    #resources :ferrets
  #end

  get '/owners', to: 'owners#index', as: 'owners'

  post '/owners', to: 'owners#create'

  get '/owners/:id', to: 'owners#show'

  get '/owners/:id/edit', to: 'owners#edit', as: 'edit_owner'

  patch '/owners/:id', to: 'owners#update'

  get '/owners/:id/busyness', to: 'owners#busyness', as: 'busyness'



  get '/ferrets', to: 'ferrets#index', as: 'ferrets'

  get 'ferrets/new', to: 'ferrets#new', as: 'new_ferret'
  
  post '/ferrets', to: 'ferrets#create'

  get '/ferrets/:id', to: 'ferrets#show'

  get '/ferrets/:id/edit', to: 'ferrets#edit'

  patch '/ferrets/:id', to: 'ferrets#update'



  get '/opportunities', to: 'opportunities#index', as: 'opportunities'

  get '/opportunities/new', to: 'opportunities#new', as: 'new_opportunity'
  
  post '/opportunities', to: 'opportunities#create'
  
  get '/opportunities/:id', to: 'opportunities#show'

  get '/opportunities/:id/edit', to: 'opportunities#edit'
  
  patch '/opportunities/:id', to: 'opportunities#update'

  get '/opportunities/:id/case_status', to: 'opportunities#case_status', as: 'case_status'



end