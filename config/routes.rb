Rails.application.routes.draw do
  get "posts/search" => "posts#search"


  
  get "users/:id/likes" => "users#likes"
  post "likes/:post_id/destroy" => "likes#destroy"
  post "likes/:post_id/create" => "likes#create"
  post "logout" => "users#logout"
  get "login" => "users#login_form"
  post "login" => "users#login"
  post "users/:id/update" => "users#update"
  get "users/:id/edit" => "users#edit"
  post "users/create" => "users#create"
  get "signup" => "users#new"
  get "users/index" => "users#index"
  get "users/:id" => "users#show"
  post "posts/:id/update" => "posts#update"
  post "posts/:id/destroy" => "posts#destroy"
  get "posts/:id/edit" => "posts#edit"
  post "posts/create" => "posts#create"
  get "posts/new" => "posts#new"
  get "posts/index" => "posts#index"
  get "posts/:id" => "posts#show"
  get "/" => "home#top"
  get "about" => "home#about"


  get "javascript" => "posts#javascript"

end
