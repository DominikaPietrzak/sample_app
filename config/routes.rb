Rails.application.routes.draw do
  get 'static_pages/home'
  get 'hello' =>'application#hello'
  get 'test'=>'application#test'
  get 'test2' => 'application#test2'
  root 'static_pages#home'
  get '/help', to: 'static_pages#help'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  #pod adresem /help będzie można wyświetlić views help z konrollera static_pages akcję help
  #path_names {new: ''}
end
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
#get '/helf', to: 'static_pages#help', as: 'helf'
#
