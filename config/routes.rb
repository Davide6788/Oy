Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  resources :businesses do
    resources :messagerooms, only: [:create]
  end

  resources :messagerooms, only: [:index, :show]

  resources :messageroom, only: :show do
    resources :messages, only: :create
  end

  resources :businesses do
    collection do
      get :my_businesses
    end
  end

  resources :businesses do
    resources :posts, only: [:new, :create, :edit, :update]
  end

  resources :posts, only: [:index, :destroy]

  resources :businesses do
    member do
      get :my_customers
    end
  end

  resources :cards, only: [] do
    member do
      patch :add_point
    end
  end

  resources :chat

  resources :cards, only: [:index, :show]
  resources :businesses
  ##, only: [:new, :create, :update, :destroy, :show]
  resources :businesses do
    resources :reward_mechanisms, only: [:new, :create]
  end
    resources :businesses do
    resources :cards, only: [:new, :create, :edit]
  end
end
