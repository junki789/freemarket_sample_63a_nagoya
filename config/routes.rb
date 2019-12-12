Rails.application.routes.draw do
  
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :addresses
  resources :brands
  resources :sizes
  resources :categories
  resources :comments
  resources :sellers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'items#index'
  resources :users, onry: [:index, :show, :edit] do
    collection do
      get 'confirmation'
      get 'credit'
    end
  end
  resources :signup, only: [:index, :create] do
    collection do
      get 'registration'
      get 'sms'
      get 'address'
      get 'creditcard'
      get 'complete'
    end
  end
  resources :items do
    collection do
      post 'purchase'
    end
  end

  resources :card, only: [:new, :show, :create] do
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end

  resources :purchase, only: [:index] do
    collection do
      get 'index', to: 'purchase#index'
      post 'pay', to: 'purchase#pay'
      get 'done', to: 'purchase#done'
    end
  end
end