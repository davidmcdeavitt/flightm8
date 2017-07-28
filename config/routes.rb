Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'pages#home'

  get '/users/new', to: 'users#survey' #Get signup form
  post '/users', to: 'users#create' #Create user and go to question page

  get '/users/:id/preferences', to: 'preferences#survey' #Get survey form
  post '/users/:id/preferences', to: 'preferences#create' #Make a new preference record, create a new session, go to deal list

  get '/users/:id/dashboard', to: 'users#dashboard' #Goes to the dashboard
  get '/api/mypreferreddeals', to: 'api/users#preferreddeals' #Returns the user's preferred deals in JSON
  get '/api/mysaveddeals', to: 'api/users#saveddeals' #Returns the user's saved deals in JSON
  get '/api/alldeals', to: 'api/users#alldeals'

  get '/login', to: 'pages#show_login' #Get the login page
  post '/login', to: 'pages#login' #Create a new session and go to deal list
  delete '/login', to: 'pages#logout' #Clear the session out and go to login

  get '/save/deals/:deal_id', to: 'deals#favourite'
  get '/users/:user_id/deals/:deal_id', to: 'deals#purchase'

end
