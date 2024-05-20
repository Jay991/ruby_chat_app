Rails.application.routes.draw do
  devise_for :users
  
  authenticated :user do
    root 'chats#index', as: :authenticated_root
  end

  root 'home#index'

  resources :chats, only: [:index, :show, :new, :create] do
    resources :messages, only: [:create]
  end
end
