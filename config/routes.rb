Rails.application.routes.draw do

  devise_for :users
  resources :groups, except: [:destroy] do
    get "join" => "groups#join"
    get "leave" => "groups#leave"
  end
  get 'relationships/followers'
  get 'relationships/followings'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "homes#top"
  get "home/about"=>"homes#about"
  get "search" => "searches#search"

  resources :books, only: [:index,:show,:edit,:create,:destroy,:update] do
    resource :favorites, only: [:create,:destroy]

    resources :book_comments, only: [:create,:destroy]
  end

  resources :users, only: [:index,:show,:edit,:update] do
    resource :relationships, only: [:create,:destroy]
    get "following" => "relationships#following", as: "following"
    get "followers" => "relationships#followers", as: "followers"
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
