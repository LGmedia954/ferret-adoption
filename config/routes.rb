Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'static#home'

  get 'owners/new', to: 'owners#new', as: 'signup'

  get '/sessions/new', to: 'sessions#new'
 
  post '/sessions/create', to: 'sessions#create', as: 'login'
  
  delete '/sessions/destroy', to: 'sessions#destroy', as: 'logout'



  resources :owners

  get '/welcome/home', to: 'welcome#home'

  get 'about', to: 'static#about'



  resources :owners do
    resources :ferrets
  end

  get '/owners/:id/busyness', to: 'owners#busyness', as: 'busyness'

  
  
  resources :opportunities

  get '/opportunities/:id/case_status', to: 'opportunities#case_status', as: 'case_status'




  

end