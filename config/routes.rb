Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
    get '/users/:id' => 'users#show'
    post '/users' => 'users#create'
    patch '/users/:id' =>'users#update'
    delete 'users/:id' => 'users#destroy'

    
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

    post '/images' => 'images#create'
    delete '/images/:id' => 'images#destroy'
  end
end
