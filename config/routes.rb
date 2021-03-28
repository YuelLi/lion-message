Rails.application.routes.draw do
  root 'posts#index'
  resources :posts do
    resources :replies
  end
  # get 'posts/show'
  # get 'posts/new'
  # posts 'posts/create'
  # get 'posts/edit'
  # get 'posts/update'
  # get 'posts/delete'
  # get 'posts/index'
  resources :users, only: [:new, :create]
  get 'user', to: 'users#show'
  get '/', to: 'sessions#welcome'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#logout'
  get 'welcome', to: 'sessions#welcome'
  get 'authorized', to: 'sessions#page_requires_login'
  post 'users/create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

