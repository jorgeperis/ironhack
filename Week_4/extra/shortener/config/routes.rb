Rails.application.routes.draw do
  get '/', to: 'links#index'
  post '/create', to: 'links#create'
  get '/most_visited_pages', to: 'links#visited'
  get '/:shortlink', to: 'links#redirect'
end
