Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :addresses
  resources :brands
  resources :sizes
  resources :categories
  resources :comments
  resources :sellers
  resources :items
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'items#index'
  resources :users, onry: [:index, :show, :edit] do
    collection do
      get 'confirmation'
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
end