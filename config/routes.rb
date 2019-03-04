# frozen_string_literal: true

Rails.application.routes.draw do
  # RESTful routes
  resources :examples, except: %i[new edit]

  # Custom routes
  post '/sign-up' => 'users#signup'
  post '/sign-in' => 'users#signin'
  delete '/sign-out' => 'users#signout'
  patch '/change-password' => 'users#changepw'

  # route for patients that i created
  get '/patients' => 'patients#index'
  get '/ingredients' => 'ingredients#index'

  # route for SHOW each book
  get '/patients/:id' => 'patients#show'
  get '/ingredients/:id' => 'ingredients#show'
  post '/patients/' => 'patients#create'
  post '/ingredients' => 'ingredients#create'
  patch '/patients' => 'patients#create'
end
