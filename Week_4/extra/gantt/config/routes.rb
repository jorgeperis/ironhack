Rails.application.routes.draw do
  get '/', to: 'projects#index'
  get '/colleague/new', to: 'colleagues#new'
  post '/colleagues', to: 'colleagues#create'
  get '/task/new', to: 'tasks#new'
  post '/show', to: 'projects#show'
  get '/new', to: 'projects#new'
  post '/projects', to: 'projects#create'
  post '/tasks', to: 'tasks#create'
  get '/view/:id', to: 'projects#view'
  get '/task/:id', to: 'tasks#details'
  get '/colleague/details/:id', to: 'colleagues#details'
end
