Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'static#home'

  get 'owners/new', to: 'owners#new', as: 'signup'

  get '/sessions/new', to: 'sessions#new'

  post '/sessions/create', to: 'sessions#create', as: 'login'

  #get '/auth/:provider/callback', to: 'sessions#omniauth'
  match '/auth/:provider/callback', to: 'sessions#omniauth', via: [:get, :post]
  
  get '/sessions/destroy', to: 'sessions#destroy', as: 'logout'



  get '/welcome/home', to: 'welcome#home'

  get '/about', to: 'static#about'

  get '/questions', to: 'static#questions'


  
  resources :ferrets, only: [:index, :show]

  resources :opportunities, only: [:index, :show]



  resources :owners do
    resources :ferrets, except: [:index]
  end

  get '/owners/:owner_id/busyness', to: 'owners#busyness', as: 'busyness'

  resources :owners do
    resources :opportunities
  end

  match '/owners/:owner_id/opportunities/:id', to: 'owners#adoption_request', as: 'adoption_request', via: [:get, :post, :patch]

  scope '/status' do
    get 'found_home', to: 'ferrets#found_home'
  end



end