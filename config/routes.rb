Rails.application.routes.draw do
  resources :user_deals
  resources :preferences
  resources :deals
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'pages#home'

  get '/users/new', to: 'users#show_signup'

  post '/users', to: 'users#signup'

  get '/login', to: 'pages#show_login'

  post '/session', to: 'pages#login'

  get '/deals', to: 'pages#deals'  #change later from pages to deals/user controller

  get '/save_deal', to: 'pages#show_save_deal' #change later from pages to deals/user controller

  post '/add_to_favorites', to: 'pages#add_to_favorites' #change later from pages to deals/user controller

end
