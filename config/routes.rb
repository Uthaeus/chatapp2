Rails.application.routes.draw do

  root to: 'pages#home'


  resources :discussions

  resources :users, only: [:new, :create] do 
    resources :chats, only: [:index, :show, :create]
  end

  resources :sessions, only: [:new, :destroy, :create]

  resources :messages, only: [:create]

  mount ActionCable.server => '/cable'
  
end
