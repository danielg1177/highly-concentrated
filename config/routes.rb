Rails.application.routes.draw do
  devise_for :users
  get 'pages/about_us', to: 'pages#about_us'
  get 'pages/faq', to: 'pages#faq'
  resources :users do
    get 'chats/messages', to: "chats#messages", as: 'show_messages'
    resources :chats, only: %i[create]
  end
  get 'purchase_requests/seller_options', to: "purchase_requests#seller_options", as: 'seller_options'
  get 'purchase_requests/dashboard', to: "purchase_requests#dashboard", as: 'dashboard'
  get 'ganjas/edible', to: "ganjas#edible", as: 'ganja_edible'
  get 'ganjas/flower', to: "ganjas#flower", as: 'ganja_flower'
  get 'chats/index', to: "chats#index", as: 'messages'
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :ganjas do
    resources :purchase_requests, only: %i[new create]
  end
  resources :purchase_requests, except: %i[new create] do
    patch :accept
    patch :decline
  end
end
