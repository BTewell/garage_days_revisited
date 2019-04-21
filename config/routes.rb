Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
    post '/users' => 'users#create'
    
    post '/sessions' => 'sessions#create'

    get '/events' => 'events#index'
    get '/events/:id' => 'events#show'
    post '/events' => 'events#create'
    patch '/events/:id' => 'events#update'
    delete '/events/:id'=> 'events#destroy'

    get '/items' => 'items#index'
    get '/items/:id' => 'items#show'
    post '/items' => 'items#create'
    patch '/items/:id' => 'items#update'
    delete '/items/:id'=> 'items#destroy'
  end
end
