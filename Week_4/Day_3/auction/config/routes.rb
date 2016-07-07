Rails.application.routes.draw do
  get '/users/new', to: 'user#new'
  post '/users', to: 'user#create'
  get '/users/show', to: 'user#show'
  get 'products/new', to: 'product#new'
  post '/products', to: 'product#create'
  get '/products/show', to: 'product#show'
  post '/bids', to: 'bid#create'
  get '/', to: 'sessions#login'
  post '/login', to: 'sessions#create'
  get "/products/:id", to: 'product#info'
  delete "/product/destroy", to: 'product#destroy'
end
