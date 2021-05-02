Rails.application.routes.draw do
  devise_for :users
  resources :users
  get 'ganjas/edible', to: "ganjas#edible", as: 'ganja_edible'
  get 'ganjas/flower', to: "ganjas#flower", as: 'ganja_flower'
  root to: 'pages#home'
  resources :ganjas, except: %i[edit update] do
    resources :purchase_requests, only: %i[new create]
  end
  resources :purchase_requests do
    patch :accept
  end
end
