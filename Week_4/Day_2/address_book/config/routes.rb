Rails.application.routes.draw do
  get '/contacts',to: 'contacts#index'
  get '/new', to: 'contacts#new'
  post '/contacts', to: 'contacts#create'
  get '/moreinfo', to: 'contacts#moreinfo'
  post '/favorite', to: 'contacts#favorite'
  get '/search', to: 'contacts#search'
  post '/avatar', to: 'contacts#avatar'
end
