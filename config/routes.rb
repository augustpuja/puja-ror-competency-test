Rails.application.routes.draw do
  root to: 'homes#index'  
  get 'homes/index'

  devise_for :users
  scope '/admin' do
    resources :users
  end

  resources :articles
  resources :roles
  resources :users

  authenticated :user do
    root to: 'articles#index', as: :authenticated_root
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

