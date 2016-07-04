Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'site#home'
  get '/text_inspection/new', to: 'text_inspection#new'
  post '/text_inspection', to: 'text_inspection#create'
  get 'asciis/new', to: 'asciis#new'
  post '/asciis', to: 'asciis#create'
  get 'slipsum/new', to: 'slipsum#new'
  post '/slipsum', to: 'slipsum#create'
end
