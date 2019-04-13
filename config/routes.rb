Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
    post '/users' => 'users#create'
    get '/users' => 'users#index'

    get '/events' => 'events#index'
    get '/events/:id' => 'events#show'
    post '/events' => 'events#create'
    patch '/events/:id' => 'events#update'
    delete '/events/:id'=> 'events#destroy'
  end
end
