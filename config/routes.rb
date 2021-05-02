Rails.application.routes.draw do
  devise_for :users
  resources :users
  root to: 'pages#home'
  resources :ganjas, except: %i[edit update] do
    resources :purchase_requests, only: %i[new create]
    get :edible
    get :flower
  end
  resources :purchase_requests do
    patch :accept
  end
end
