Rails.application.routes.draw do
  devise_for :users

  get 'products/new', to: 'product#new'
  post '/products', to: 'product#create'
  get '/products/show', to: 'product#show'
  post '/bids', to: 'bid#create'
  get "/products/:id", to: 'product#info'
  delete "/product/destroy", to: 'product#destroy'
  get "/", to: 'product#show'
end
