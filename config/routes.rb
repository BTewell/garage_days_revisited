Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
    post '/users' => 'users#create'

    get '/events' => 'events#index'
    get '/events/:id' => 'events#show'
  end
end
