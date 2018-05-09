Rails.application.routes.draw do
  get 'static_pages/home'
  get 'static_pages/help'
  get 'static_pages/contact'
  get 'hello' =>'application#hello'
  get 'test'=>'application#test'
  get 'test2' => 'application#test2'
  get 'static_pages/about'
  root 'static_pages#home'
end
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
#get '/helf', to: 'static_pages#help', as: 'helf'
#
