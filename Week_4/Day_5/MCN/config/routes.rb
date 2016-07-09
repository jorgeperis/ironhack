Rails.application.routes.draw do
  get '/', to: 'concerts#index'
  get '/new', to: 'concerts#new'
  post '/concerts', to: 'concerts#create'
  get 'concerts/:id/details', to: 'concerts#details'
  post '/comments/:id', to: 'comments#create', as: :comments
  get '/price', to: 'concerts#price'
  get '/popular', to: 'concerts#popular'
end
