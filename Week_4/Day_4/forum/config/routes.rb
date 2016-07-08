Rails.application.routes.draw do
  get '/', to: 'movies#index'
  post '/search', to: 'movies#search'
  get '/show', to: 'movies#show'
  get '/info/:id', to: 'movies#info'
  get '/create/:movieid', to: 'movies#create'
  get '/comments/:movieid/new', to: 'comments#create'
end
