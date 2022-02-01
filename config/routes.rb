Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :cards, only: [:index, :show]
  resources :businesses
  ##, only: [:new, :create, :update, :destroy, :show]
  resources :businesses do
    resources :reward_mechanisms, only: [:new, :create]
  end
end
