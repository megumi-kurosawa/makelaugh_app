Rails.application.routes.draw do
  devise_for :emails
  get "signup" => "users#new"
  get "login" => "users#login_form"
  post "login" => "users#login"
  get "logout" => "users#logout"
  post "logout" => "users#logout"
  get "users/index" => "users#index"
  get "users/:id" => "users#show"
  post "users/create" => "users#create"
  get "users/:id/edit" => "users#edit"
  post "users/:id/update" => "users#update"

  get "messages/index" => "messages#index"
  get "messages/:user_id/post" => "messages#new"
  post "messages/:user_id/create" => "messages#create"
  get "messages/:user_id" => "messages#show"

  get "posts/new" => "posts#new"
  post "posts/create" => "posts#create"
  get "posts/index" => "posts#index"
  get "posts/:id" => "posts#show"
  post "posts/:id/destroy" => "posts#destroy"

  get '/' => 'home#top'
  get 'about' => 'home#about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
