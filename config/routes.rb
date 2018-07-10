Rails.application.routes.draw do

  root to: 'chats#index'
  
  get 'pages/home'

  resources :users, only: [:new, :create] do 
    resources :chats, only: [:index, :show, :create]
  end

  resources :sessions, only: [:new, :destroy, :create]

  resources :messages, only: [:create]

  mount ActionCable.server => '/cable'
  
end
