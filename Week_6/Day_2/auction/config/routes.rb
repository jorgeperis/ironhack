Rails.application.routes.draw do
  devise_for :users

  get 'products/new', to: 'product#new'
  post '/products', to: 'product#create'
  get '/products/show', to: 'product#show'
  post '/bids', to: 'bid#create'
  get "/products/:id", to: 'product#info'
  delete "/product/destroy", to: 'product#destroy'
  get "/", to: 'product#show'
  post '/reviews', to: 'review#create'
  patch '/review', to: 'review#patch'
  get '/reviews/edit/:id', to: 'review#edit'
  get '/user/profile', to: 'user#show'
end
