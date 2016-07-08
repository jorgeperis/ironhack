Rails.application.routes.draw do
  get '/', to: 'movies#index'
  post '/search', to: 'movies#search'
  get '/show', to: 'movies#show'
  get '/info/:id', to: 'movies#info'
  get '/create/:movieid', to: 'movies#create'
  get '/comments/:movieid/new', to: 'comments#new'
  post '/comments/:movieid', to: 'comments#create', as: :comments
  get '/comments/:movieid/login', to: 'movies#login'
  post 'comments/:movieid/checklogin', to: 'movies#checklogin', as: :login_path
  get '/comments/:userid', to: 'users#show'
end
