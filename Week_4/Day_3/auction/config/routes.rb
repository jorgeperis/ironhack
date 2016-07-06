Rails.application.routes.draw do
  get '/users/new', to: 'user#new'
  post '/users', to: 'user#create'
  get '/users/show', to: 'user#show'
  get 'products/new', to: 'product#new'
  post 'products', to: 'product#create'
  get 'products/show', to: 'product#show'
  get 'products/:id', to: 'product#info'
end
