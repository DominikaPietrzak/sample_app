Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  default_url_options :host => "example.com"
  get 'static_pages/home'

  root 'static_pages#home'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  get '/signup',  to: 'users#new'
  post 'signup', to: 'users#create'
  resources :users do
    resources :notes
  end
  #do
    # member do
    #   get :following, :followers
    # end
   #end

  resources :account_activations, only: [:edit]
  resources :notes, only: [:create, :destroy]

  #pod adresem /help będzie można wyświetlić views help z konrollera static_pages akcję help
  #path_names {new: ''}
end
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
#get '/helf', to: 'static_pages#help', as: 'helf'
#
