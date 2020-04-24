Rails.application.routes.draw do
  get 'search' => 'search#search', as: 'search'
  devise_for :users, controllers: {
    registrations: "users/registrations"
  }
  resources :users,only: [:show,:index,:edit,:update] do
    resource :relationships, only: [:create, :destroy]
    get :follows, on: :member
    get :followers, on: :member
  end

  resources :books do
    resource :favorites, only: [:create, :destroy]
    resource :book_comments, only: [:create, :destroy]
  end

  resources :chats, only: [:create]
  resources :rooms, only: [:create,:show]
  
  root 'home#top'
  get 'home/about'
end