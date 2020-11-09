Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/start', to: 'games#start'
  post '/score', to: 'games#score'
end
