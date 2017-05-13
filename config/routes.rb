Rails.application.routes.draw do
  resources :tutorials
  resources :jobs
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'admin' => 'admin#index'
  controller :sessions do
    get  'login' => :new
    post 'login' => :create
    get 'logout' => :destroy
  end

  root 'main#index'

  get '/home' => 'main#home'
end
