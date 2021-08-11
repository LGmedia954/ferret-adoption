Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'static#home'

  get '/owners/new', to: 'owners#new', as: 'signup'

  get 'about', to: 'static#about'

  get '/owners', to:'owners#index', as: 'owners'

  post '/owners', to:'owners#create'

  get '/owners/:id', to: 'owners#show', as: 'owner'

  get '/owners/:id/edit', to: 'owners#edit', as: 'edit_owner'

  get '/owners/:id/busyness', to: 'owners#busyness', as: 'busyness'



  get '/ferrets', to: 'ferrets#index', as: 'ferrets'

  get '/ferrets/new', to: 'ferrets#new', as: 'new_ferret'
  
  post '/ferrets', to: 'ferrets#create'

  get '/ferrets/:id', to: 'ferrets#show', as: 'ferret'

  get '/ferrets/:id/edit', to: 'ferrets#edit', as: 'edit_ferret'

  patch '/ferrets/:id', to: 'ferrets#update'



  get '/opportunities', to: 'opportunities#index', as: 'opportunities'

  get '/opportunities/new', to: 'opportunities#new', as: 'new_opportunity'
  
  post '/opportunities', to: 'opportunities#create'
  
  get '/opportunities/:id', to: 'opportunities#show', as: 'opportunity'

  get '/opportunities/:id/edit', to: 'opportunities#edit', as: 'edit_opportunity'
  
  patch '/opportunities/:id', to: 'opportunities#update'

  #get '/opportunities/:id/activate', to: 'opportunities#case_status', as: 'case_status'



end