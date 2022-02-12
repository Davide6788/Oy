Rails.application.routes.draw do
  # get 'posts/new'
  # get 'posts/create'
  # get 'posts/edit'
  # get 'posts/update'
  # get 'posts/delete'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :businesses do
    collection do
      get :my_businesses
    end
  end

  resources :businesses do
    resources :posts, only: [:new, :create, :edit, :update, :destroy]
  end

  resources :posts, only: [:index]

  resources :businesses do
    member do
      get :my_customers
    end
  end

  resources :cards do
    member do
      patch :add_point
    end

  resources :chat

  resources :cards, only: [:index, :show,]
  resources :businesses
  ##, only: [:new, :create, :update, :destroy, :show]
  resources :businesses do
    resources :reward_mechanisms, only: [:new, :create]
  end
    resources :businesses do
    resources :cards, only: [:new, :create, :edit]
  end
end
end
