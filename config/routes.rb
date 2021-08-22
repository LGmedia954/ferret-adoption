Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'static#home'

  get 'owners/new', to: 'owners#new', as: 'signup'

  get '/sessions/new', to: 'sessions#new'
 
  post '/sessions/create', to: 'sessions#create', as: 'login'
  
  get '/sessions/destroy', to: 'sessions#destroy', as: 'logout'



  get '/welcome/home', to: 'welcome#home'

  get '/about', to: 'static#about'

  get '/questions', to: 'static#questions'


  
  resources :ferrets, only: [:index, :show]

  resources :opportunities

  resources :owners do
    resources :ferrets, except: [:index]
    resources :opportunities
  end

  get '/owners/:owner_id/busyness', to: 'owners#busyness', as: 'busyness'


end